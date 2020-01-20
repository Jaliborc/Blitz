--[[
Copyright 2009-2020 João Cardoso
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

local Blitz = LibStub('WildAddon-1.0'):NewAddon('Blitz', CreateFrame('CheckButton', 'Blitz', ImmersionContentFrame or QuestFrame, 'OptionsSmallCheckButtonTemplate'))
local BIG = 2^10000


--[[ Startup ]]--

function Blitz:OnEnable()
	self:SetScript('OnClick', self.ToggleQuest)
	self:SetFontString(_G[self:GetName() .. 'Text'])
	self:SetText(self.Locals.AutomateQuest)
	self:RegisterEvent('GOSSIP_SHOW')
	self:RegisterEvent('QUEST_GREETING')
	self:RegisterEvent('QUEST_DETAIL')
	self:RegisterEvent('QUEST_PROGRESS')
	self:RegisterEvent('QUEST_COMPLETE')
	self:OnSettings()

	if ImmersionContentFrame then
		self:SetPoint('TOPRIGHT', -80, 0)
	else
		self:SetPoint('TOPLEFT', 74, WOW_PROJECT_ID == WOW_PROJECT_CLASSIC and -50 or -30)
	end

	hooksecurefunc('QuestInfoItem_OnClick', function() self:SaveQuest() end)
	CreateFrame('Frame', nil, InterfaceOptionsFrame):SetScript('OnShow', function()
		LoadAddOn('Blitz_Config')
	end)
end

function Blitz:OnSettings()
	Blitz_Sets = Blitz_Sets or {
		quests = Blitz_Quests or {},
		tutorial = Blitz_Tutorials,
		key = Blitz_Key or 'Shift'
	}

	self.sets = Blitz_Sets
end

function Blitz:OnTutorials()
	if self.sets.tutorials ~= 2 and LoadAddOn('Blitz_Config') then
		Blitz.Tutorials:Show()
	end
end


--[[ Gossip Events ]]--

function Blitz:GOSSIP_SHOW()
	if self:IsKeyDown() and not self:BestSkip(GetNumGossipActiveQuests, GetGossipActiveQuests, SelectGossipActiveQuest, 5) then
		self:BestSkip(GetNumGossipAvailableQuests, GetGossipAvailableQuests, SelectGossipAvailableQuest, 6)
	end
end

function Blitz:QUEST_GREETING()
	if self:IsKeyDown() and not self:BestSkip(GetNumActiveQuests, GetActiveTitle, SelectActiveQuest, 1) then
		self:BestSkip(GetNumAvailableQuests, GetAvailableTitle, SelectAvailableQuest, 1)
	end
end

function Blitz:BestSkip(total, get, set, args)
	local off, delivers = args - 1, BIG
	local quest

	for i = 1, total() do
		local name = select(i * args - off, get(i))
		local num = self:NumSkips(name)
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


--[[ Quest Events ]]--

function Blitz:QUEST_DETAIL()
	if self:IsKeyDown() and (self.sets.accept or self:IsEnabled(GetTitleText())) then
		AcceptQuest()
	end
	self:UpdateButton()
end

function Blitz:QUEST_PROGRESS()
	if self:IsKeyDown() and self:NumSkips(GetTitleText()) then
		CompleteQuest()
	end
	self:UpdateButton(true)
end

function Blitz:QUEST_COMPLETE()
	if self:IsKeyDown() then
		local name = GetTitleText()
		local data = self:IsEnabled(name)
		local numSkips = self:NumSkips(name)
		local item = self:GetReward(data)

		if numSkips then
			if GetNumQuestChoices() == 0 or item > 0 then
				GetQuestReward(item)

				if numSkips > 1 and LoadAddOn('Blitz_Progress') then
					Blitz.Progress:ShowQuest(name, data, numSkips)
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

	self:UpdateButton(true)
end


--[[ Button ]]--

function Blitz:UpdateButton(active)
	local name = GetTitleText()
	local isRepeatable = active and not self:GetLogData(name)

	if self:IsDaily() or isRepeatable then
		self:SetChecked(self:IsEnabled(name) and true)
		self:OnTutorials()
		self:Show()
	else
		self:Hide()
	end
end

function Blitz:ToggleQuest()
	local name = GetTitleText()
	self.sets.quests[name] = not self.sets.quests[name] or nil
	self:SaveQuest()
end

function Blitz:SaveQuest()
	local reward = QuestInfoFrame.itemChoice or 0
	local name = GetTitleText()

	if self:IsEnabled(name) then
		if self:IsDaily() then
			self.sets.quests[name] = reward
		else
			local data = ''
			for i = 1, GetNumQuestItems() do
				local id = self:GetItem('required', i)
				if id then
					data = data .. ':'.. id .. ':' .. select(3, GetQuestItemInfo('required', i))
				end
			end

			local money = GetQuestMoneyToGet()
			if money > 0 then
				data = data .. ';' .. money
			end

			if reward ~= 0 then
				data = data .. '|' .. reward
			end

			self.sets.quests[name] = data
		end
	end
end


--[[ Skip ]]--

function Blitz:NumSkips(name)
	local data = self:IsEnabled(name)
	if type(data) ~= 'string' then
		return self:CanSkip(name, data) and 0
	else
		return self:NumStacks(data)
	end
end

function Blitz:CanSkip(name, data)
	local active, completed = self:GetLogData(name)
	if active then
		return (data or self.sets.deliver) and completed
	else
		return data
	end
end

function Blitz:NumStacks(data)
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


--[[ Data ]]--

function Blitz:GetLogData(name)
	for i = 1, MAX_QUESTLOG_QUESTS * 2 do
		local title, _,_,_,_, complete = GetQuestLogTitle(i)
		if title == name then
			return true, complete
		end
	end
end

function Blitz:GetItem(kind, i)
	return strmatch(GetQuestItemLink(kind, i) or '', 'item:(%d+)')
end

function Blitz:GetReward(data)
	local item = type(data) == 'string' and strmatch(data, '|(%d+)') or data

	if not item and self.sets.reward then
		local best = 0
		for i = 1, GetNumQuestChoices() do
			local id = self:GetItem('choice', i)
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

function Blitz:IsDaily()
	return (QuestIsDaily and QuestIsDaily()) or (QuestIsWeekly and QuestIsWeekly())
end

function Blitz:IsEnabled(name)
	return self.sets.quests[name]
end

function Blitz:IsKeyDown()
	local down = self.sets.key and _G['Is' .. self.sets.key .. 'KeyDown']()
	if not self.sets.manual then
		down = not down
	end
	return down
end
