--[[
Copyright 2009-2026 João Cardoso
All Rights Reserved
--]]

local ADDON, Addon = ...
local C = LibStub('C_Everywhere')
local Blitz = LibStub('WildAddon-1.1'):NewAddon(ADDON, Addon, 'StaleCheck-1.0')


--[[ Startup ]]--

function Blitz:OnLoad()
	self.sets = self:SetDefaults(Blitz_Sets or {}, {quests = {}, key = 'Shift'})
	self:CheckForUpdates(ADDON, self.sets, 'Interface/PVPFrame/Icons/prestige-icon-4-1')

	SettingsPanel.CategoryList:HookScript('OnShow', function() self:LoadModule('Config') end)
	Blitz_Sets = self.sets
end

function Blitz:LoadModule(name)
	return C.AddOns.LoadAddOn(ADDON ..'_'.. name)
end


--[[ Basics ]]--

function Blitz:IsEnabled(id)
	if id and id > 0 and self.sets.quests[id] ~= false then
		return self.sets.quests[id] or Addon.sets.warband and C.QuestLog.IsQuestFlaggedCompletedOnAccount(id)
	end
end

function Blitz:IsKeyDown()
	local down = self.sets.key and _G['Is' .. self.sets.key .. 'KeyDown']()
	if self.sets.manual then
		return down
	end
	return not down
end