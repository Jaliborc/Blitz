--[[
Copyright 2009-2023 João Cardoso
All Rights Reserved
--]]

local ADDON, Addon = ...
local Blitz = LibStub('WildAddon-1.0'):NewAddon('Blitz', Addon)


--[[ Startup ]]--

function Blitz:OnEnable()
	CreateFrame('Frame', nil, SettingsPanel or InterfaceOptionsFrame):SetScript('OnShow', function() LoadAddOn(ADDON .. '_Config') end)
	self:OnSettings()
end

function Blitz:OnSettings()
	Blitz_Sets = Blitz_Sets or {quests = {}, key = 'Shift'}
	self.sets = Blitz_Sets
end


--[[ Basics ]]--

function Blitz:IsEnabled(id)
	return id and self.sets.quests[id]
end

function Blitz:IsKeyDown()
	local down = self.sets.key and _G['Is' .. self.sets.key .. 'KeyDown']()
	if self.sets.manual then
		return down
	end
	return not down
end
