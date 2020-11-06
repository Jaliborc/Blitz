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

local ADDON, Addon = ...
local Button = Addon:NewModule('Button', CreateFrame('CheckButton', 'Blitz', ImmersionContentFrame or QuestFrame, 'OptionsSmallCheckButtonTemplate'))


--[[ Startup ]]--

function Button:OnEnable()
  self:SetScript('OnClick', self.OnClick)
  self:SetFontString(_G[self:GetName() .. 'Text'])
  self:SetText(Addon.Locals.AutomateQuest)
  self:RegisterEvent('QUEST_DETAIL', 'UpdateOffer')
  self:RegisterEvent('QUEST_PROGRESS', 'UpdateActive')
  self:RegisterEvent('QUEST_COMPLETE', 'UpdateActive')

  if not ImmersionContentFrame then
    self:SetPoint('TOPLEFT', 74, WOW_PROJECT_ID == WOW_PROJECT_CLASSIC and -50 or -30)
  else
    self:SetPoint('TOPRIGHT', -80, 0)
  end

  hooksecurefunc('QuestInfoItem_OnClick', function()
    self:SaveQuest()
  end)
end

function Button:OnClick()
	local id = GetQuestID()
	Addon.sets.quests[id] = not Addon.sets.quests[id] or nil
	self:SaveQuest()
end


--[[ Update ]]--

function Button:UpdateOffer()
  self:UpdateButton(false)
end

function Button:UpdateActive()
  self:UpdateButton(true)
end


function Button:UpdateButton(active)
	local id = GetQuestID()
	local repeatable = C_QuestLog.IsRepeatableQuest and C_QuestLog.IsRepeatableQuest(id)
                        or active and not C_QuestLog.IsOnQuest(id)

	if self:IsPeriodic() or repeatable then
		self:SetChecked(Addon:IsEnabled(id) and true)
		self:Show()

    if Addon.sets.tutorials ~= 2 and LoadAddOn(ADDON .. '_Config') then
  		Addon.Tutorials:Show()
  	end
	else
		self:Hide()
	end
end


--[[ API ]]--

function Button:SaveQuest()
	local reward = QuestInfoFrame.itemChoice or 0
	local id = GetQuestID()

	if Addon:IsEnabled(id) then
		if self:IsPeriodic() then
			Addon.sets.quests[id] = reward
		else
			local data = ''
			for i = 1, GetNumQuestItems() do
				local id = Addon.Server.GetItem('required', i)
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

			Addon.sets.quests[id] = data
		end
	end
end

function Button:IsPeriodic()
	return (QuestIsDaily and QuestIsDaily()) or (QuestIsWeekly and QuestIsWeekly())
end
