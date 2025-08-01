--[[
Copyright 2009-2025 João Cardoso
All Rights Reserved
--]]

local C = LibStub('C_Everywhere')
local Progress = Blitz:NewModule('Progress')
local Alerts = AlertFrame:AddSimpleAlertFrameSubSystem('AchievementAlertFrameTemplate', function(frame, ...)
	Progress.Startup(frame)
	Progress.Display(frame, ...)
end)


--[[ External ]]--

function Progress:ShowQuest(...)
	Alerts:AddAlert(...)
end


--[[ Internal ]]--

function Progress:Startup()
	if self.Arrow then
		return
	end

	self.Background.Patch = self:CreateTexture(nil, 'BORDER')
	self.Background.Patch:SetTexture('Interface/Addons/Blitz/art/background-patch')
	self.Background.Patch:SetPoint('CENTER', self.Background, 104, -20)

	self.PortraitBorder = self:CreateTexture(nil, 'OVERLAY', nil, 7)
	self.PortraitBorder:SetTexture('Interface/AchievementFrame/UI-Achievement-IconFrame')
	self.PortraitBorder:SetTexCoord(0.5625, 0, 0, 0.5625)
	self.PortraitBorder:SetPoint('TOPRIGHT', 0, -7)
	self.PortraitBorder:SetSize(73, 73)

	self.Portrait = self:CreateTexture(nil, 'ARTWORK')
	self.Portrait:SetPoint('CENTER', self.PortraitBorder)
	self.Portrait:SetSize(55, 55)

	self.Unlocked.Back = self:CreateTexture(nil, 'ARTWORK')
	self.Unlocked.Back:SetTexture('Interface/AchievementFrame/UI-Achievement-Reward-Background')
	self.Unlocked.Back:SetVertexColor(.5, .5, .5)
	self.Unlocked.Back:SetPoint('TOP', 40, -15)
	self.Unlocked.Back:SetTexCoord(0, 1, 1, 0)
	self.Unlocked.Back:SetSize(250, 21)

	self.Icon.Count = self.Icon:CreateFontString(nil, 'OVERLAY', 'NumberFontNormal')
	self.Icon.Count:SetPoint('BOTTOMRIGHT', self.Icon.Texture, -4, 4)

	self.Arrow = self:CreateTexture(nil, 'ARTWORK')
	self.Arrow:SetTexture('Interface/Addons/Blitz/art/arrow')
	self.Arrow:SetPoint('CENTER', 1, -2)
	self.Arrow:SetSize(190, 50)

	self.Arrow.Fill = self:CreateTexture(nil, 'OVERLAY', nil, 5)
	self.Arrow.Fill:SetTexture('Interface/Addons/Blitz/art/arrow-fill')
	self.Arrow.Fill:SetPoint('LEFT', self.Arrow)
	self.Arrow.Fill:SetHeight(50)

	self.Arrow.Spark = self:CreateTexture(nil, 'OVERLAY', nil, 6)
	self.Arrow.Spark:SetTexture('Interface/CastingBar/UI-CastingBar-Spark')
	self.Arrow.Spark:SetPoint('RIGHT', self.Arrow.Fill, 8, 0)
	self.Arrow.Spark:SetBlendMode('ADD')
	self.Arrow.Spark:SetSize(14, 14)

	self.Unlocked:SetTextColor(.8, .8, .8)
	self.Unlocked:SetDrawLayer('OVERLAY')
	self.Unlocked:SetPoint('TOP', 1, -24)
	self.Unlocked:SetWidth(110)
	self.Shield:Hide()
	self.Name:Hide()
end

function Progress:Display(id, items, numDelivers)
	local progress = Progress:GetProgress(id, numDelivers)
	local item, amount = Progress:GetWorseItem(items)

	SetPortraitTexture(self.Portrait, 'NPC')
	self.Unlocked:SetText(C.QuestLog.GetTitleForQuestID(id))
	self.Icon.Texture:SetTexture(C.Item.GetItemIconByID(item))
	self.Icon.Count:SetText(format('%s/%s', C.Item.GetItemCount(item) or '?', amount or '?'))
	self.Arrow.Fill:SetTexCoord(0, progress, 0, 1)
	self.Arrow.Fill:SetWidth(190 * progress)
	self.Arrow.Spark:SetShown(progress < 0.92)
end

function Progress:GetProgress(id, numSteps)
	self.Goals[id] = max(self.Goals[id] or numSteps, numSteps)
	self.Timeouts[id] = GetTime() + self.Delay

	C.Timer.After(self.Delay, function()
		if self.Timeouts[id] <= GetTime() then
			self.Goals[id] = nil
		end
	end)

	return 1 - min(max((numSteps - 1) / self.Goals[id], 0), 1)
end

function Progress:GetWorseItem(items)
	local leastStacks = 2^10000
	local item, amount

	for id, required in gmatch(items, '(%d+):(%d+)') do
		local stacks = floor(C.Item.GetItemCount(id) / tonumber(required))
		if stacks < leastStacks then
			leastStacks = stacks
			amount = required
			item = id
		end
	end

	return item, amount
end

Progress.Delay = 5
Progress.Alerts = Alerts
Progress.Goals, Progress.Timeouts = {}, {}
