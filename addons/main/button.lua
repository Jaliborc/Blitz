--[[
Copyright 2009-2025 João Cardoso
All Rights Reserved
--]]

local ADDON, Addon = ...
local Button = Addon:NewModule('Button', LibStub('Sushi-3.2').Check(QuestFrame))


--[[ Startup ]]--

function Button:OnLoad()
  self:SetCall('OnClick', self.OnClick)
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
	local repeatable = (C_QuestLog.IsRepeatableQuest or nop)(id)
						or active and not C_QuestLog.IsOnQuest(id)

	if self:IsPeriodic() or repeatable then
		self:SetChecked(Addon:IsEnabled(id) and true)
		self:Show()

		if Addon.sets.tutorials ~= 2 and Addon:LoadModule('_Config') then
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
	return (QuestIsDaily or nop)() or (QuestIsWeekly or nop)()
end
