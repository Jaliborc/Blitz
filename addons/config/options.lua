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

local Sushi = LibStub('Sushi-3.1')
local Options = Blitz:NewModule('Options', Sushi.OptionsGroup('Blitz|TInterface/PVPFrame/Icons/prestige-icon-4-1:16:16:0:0|t'))
local L = Blitz.Locals

local PATRONS = {{title='Jenkins',people={'Gnare','Justin Rusbatch'}},{},{title='Ambassador',people={'Fernando Bandeira','Julia F','Lolari ','Craig Falb','Mónica Sanchez Calzado','Denny Hyde','Lynx','Owen Pitcairn','Rafael Lins','Mediocre Monk'}}} -- generated patron list
local FOOTER = 'Copyright 2008-2021 João Cardoso'


--[[ Startup ]]--

function Options:OnEnable()
	local credits = Sushi.CreditsGroup(self, PATRONS)
	credits:SetSubtitle(nil, 'http://www.patreon.com/jaliborc')
	credits:SetFooter(FOOTER)

	self:SetFooter(FOOTER)
	self:SetSubtitle(L.Description)
	self:SetChildren(self.OnPopulate)
	self:SetCall('OnDefaults', self.OnDefaults)
end

function Options:OnDefaults()
	Blitz_Sets = nil
	Blitz:OnSettings()
	self:Update()
end

function Options:OnPopulate()
	self:AddInput('Check', 'accept', 'Accept')
	self:AddInput('Check', 'deliver', 'Deliver')

	if Blitz.sets.deliver then
		local reward = self:AddInput('Check', 'reward', 'SelectReward')
		reward.left = reward.left + 20
		reward:SetSmall(true)
	end

	self:AddInput('Check', 'manual', 'Manual')
	self:AddInput('DropChoice', 'key', Blitz.sets.manual and 'AutomateKey' or 'ManualKey'):AddChoices {
		{key = 'Alt', text = ALT_KEY},
		{key = 'Control', text = CTRL_KEY},
		{key = 'Shift', text = SHIFT_KEY},
		{key = false, text = NONE_KEY},
	}
end


--[[ API ]]--

function Options:AddInput(class, arg, title)
	local f = self:Add(class, L[title])
	f:SetTip(L[title], L[title .. 'Tip'])
	f:SetValue(Blitz.sets[arg])
	f:SetCall('OnInput', function(f, v)
		Blitz.sets[arg] = v
	end)

	return f
end
