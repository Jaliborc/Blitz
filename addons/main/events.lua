--[[
Copyright 2009-2025 João Cardoso
All Rights Reserved
--]]

local ADDON, Addon = ...
local Events = Addon:NewModule('Events')
local C = LibStub('C_Everywhere')
local BIG = 2^10000


--[[ Startup ]]--

function Events:OnLoad()
	self:RegisterEvent('GOSSIP_SHOW')
	self:RegisterEvent('QUEST_GREETING')
	self:RegisterEvent('QUEST_DETAIL')
	self:RegisterEvent('QUEST_PROGRESS')
	self:RegisterEvent('QUEST_COMPLETE')
end


--[[ Gossip ]]--

function Events:GOSSIP_SHOW()
	if Addon:IsKeyDown() and not self:BestSkip(C.GossipInfo.GetNumActiveQuests, Addon.Server.GetActive, C.GossipInfo.SelectActiveQuest) then
		self:BestSkip(C.GossipInfo.GetNumAvailableQuests, Addon.Server.GetAvailable, C.GossipInfo.SelectAvailableQuest)
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
		local num = self:NumSkips(get and get(i))
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
	if Addon:IsKeyDown() and (Addon.sets.accept or Addon:IsAutomated(GetQuestID())) then
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

				if skips > 1 and Addon:LoadModule('Progress') then
					Addon.Progress:ShowQuest(id, data, skips)
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
	local status = Addon:IsAutomated(id)
	if type(status) ~= 'string' then
		if id and C.QuestLog.IsOnQuest(id) then
			return (status or Addon.sets.deliver) and C.QuestLog.IsComplete(id) and 0
		end

		return status and 0
	else
		return self:NumStacks(status)
	end
end

function Events:NumStacks(data)
	local delivers = BIG
	for item, required in gmatch(data, '(%d+):(%d+)') do
		delivers = min(delivers, floor(C.Item.GetItemCount(item) / tonumber(required)))
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
			local id = Addon.Server.GetItem('choice', i)
			if id then
				local value = select(11, C.Item.GetItemInfo(id))
				if value > best then
					best = value
					item = i
				end
			end
		end
	end

	return item or 0
end