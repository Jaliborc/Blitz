--[[
Copyright 2009-2024 João Cardoso
All Rights Reserved
--]]

local ADDON, Addon = ...
local C = LibStub('C_Everywhere')
local Blitz = LibStub('WildAddon-1.0'):NewAddon(ADDON, Addon)


--[[ Startup ]]--

function Blitz:OnEnable()
	CreateFrame('Frame', nil, SettingsPanel or InterfaceOptionsFrame)
		:SetScript('OnShow', function() self:LoadModule('Config') end)

	Blitz_Sets = Blitz_Sets or {quests = {}, key = 'Shift'}
	self.sets = Blitz_Sets
end

function Blitz:LoadModule(name)
	C.AddOns.EnableAddOn(ADDON ..'_'.. name)
	return C.AddOns.LoadAddOn(ADDON ..'_'.. name)
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
