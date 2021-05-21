--[[
Copyright 2009-2021 João Cardoso
Blitz is distributed under the terms of the GNU General Public License (or the Lesser GPL).
This file is part of Blitz.

Blitz is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Blitz is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Blitz. If not, see <http://www.gnu.org/licenses/>.
--]]

local ADDON, Addon = ...
local Events = Addon:NewModule('Events')
local S, BIG = Addon.Server, 2^10000


--[[ Startup ]]--

function Events:OnEnable()
  self:RegisterEvent('GOSSIP_SHOW')
  self:RegisterEvent('QUEST_GREETING')
  self:RegisterEvent('QUEST_DETAIL')
  self:RegisterEvent('QUEST_PROGRESS')
  self:RegisterEvent('QUEST_COMPLETE')
end


--[[ Gossip ]]--

function Events:GOSSIP_SHOW()
	if Addon:IsKeyDown() and not self:BestSkip(S.NumActive, S.GetActive, S.SelectActive) then
		self:BestSkip(S.NumAvailable, S.GetAvailable, S.SelectAvailable)
	end
end

function Events:QUEST_GREETING()
	if Addon:IsKeyDown() then
		self:BestSkip(GetNumActiveQuests, GetActiveQuestID, SelectActiveQuest)
	end
end

function Events:BestSkip(total, get, set)
	local delivers, quest = BIG
	for i = 1, total() do
		local num = self:NumSkips(get(i))
		if num and num < delivers then
			delivers = num
			quest = i
		end
	end

	if quest then
		set(quest)
	end
	return quest
end


--[[ Quest ]]--

function Events:QUEST_DETAIL()
	if Addon:IsKeyDown() and (Addon.sets.accept or Addon:IsEnabled(GetQuestID())) then
		AcceptQuest()
	end
end

function Events:QUEST_PROGRESS()
	if Addon:IsKeyDown() and self:NumSkips(GetQuestID()) then
		CompleteQuest()
	end
end

function Events:QUEST_COMPLETE()
	if Addon:IsKeyDown() then
		local id = GetQuestID()
		local data = Addon:IsEnabled(id)
    local item = self:GetReward(data)
    local skips = self:NumSkips(id)

		if skips then
			if GetNumQuestChoices() == 0 or item > 0 then
				GetQuestReward(item)

				if skips > 1 and LoadAddOn('Blitz_Progress') then
					Blitz.Progress:ShowQuest(id, data, skips)
				end
			elseif data then
				QuestChooseRewardError()
			end
		end

		if item ~= 0 then
			local icon = _G['QuestRewardItem' .. item]
			if icon then
				icon:GetScript('OnClick')(icon)
			end
		end
	end
end


--[[ API ]]--

function Events:NumSkips(id)
	local data = Addon:IsEnabled(id)
	if type(data) ~= 'string' then
		if C_QuestLog.IsOnQuest(id) then
			return (data or Addon.sets.deliver) and S.IsComplete(id) and 0
		end

		return data and 0
	else
		return self:NumStacks(data)
	end
end

function Events:NumStacks(data)
	local delivers = BIG
	for item, required in gmatch(data, '(%d+):(%d+)') do
		delivers = min(delivers, floor(GetItemCount(item) / tonumber(required)))
	end

	local money = strmatch(data, ';(%d+)')
	if money then
		delivers = min(delivers, floor(GetMoney() / tonumber(money)))
	end

	if delivers > 0 and delivers < BIG then
		return delivers
	end
end

function Events:GetReward(data)
	local item = type(data) == 'string' and strmatch(data, '|(%d+)') or data

	if not item and Addon.sets.reward then
		local best = 0
		for i = 1, GetNumQuestChoices() do
			local id = S.GetItem('choice', i)
			if id then
				local value = select(11, GetItemInfo(id))
				if value > best then
					best = value
					item = i
				end
			end
		end
	end

	return item or 0
end
