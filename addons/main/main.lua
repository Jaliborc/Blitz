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
local Blitz = LibStub('WildAddon-1.0'):NewAddon('Blitz', Addon)


--[[ Startup ]]--

function Blitz:OnEnable()
	CreateFrame('Frame', nil, InterfaceOptionsFrame):SetScript('OnShow', function() LoadAddOn(ADDON .. '_Config') end)
	self:OnSettings()
end

function Blitz:OnSettings()
	Blitz_Sets = Blitz_Sets or {quests = {}, key = 'Shift'}
	self.sets = Blitz_Sets
end


--[[ Basics ]]--

function Blitz:IsEnabled(id)
	return self.sets.quests[id]
end

function Blitz:IsKeyDown()
	local down = self.sets.key and _G['Is' .. self.sets.key .. 'KeyDown']()
	if not self.sets.manual then
		down = not down
	end
	return down
end
