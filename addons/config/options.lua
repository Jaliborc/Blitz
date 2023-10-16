--[[
Copyright 2009-2023 João Cardoso
All Rights Reserved
--]]

local Sushi = LibStub('Sushi-3.1')
local Options = Blitz:NewModule('Options', Sushi.OptionsGroup('Blitz|TInterface/PVPFrame/Icons/prestige-icon-4-1:16:16:0:0|t'))
local L = Blitz.Locals

local PATRONS = {{},{title='Jenkins',people={'Gnare','Adcantu','Justin Hall','Debora S Ogormanw','Johnny Rabbit'}},{title='Ambassador',people={'Julia F','Lolari ','Rafael Lins','Dodgen','Kopernikus ','Ptsdthegamer','Burt Humburg','Adam Mann','Christie Hopkins','Bc Spear','Jury ','Tigran Andrew','Jeffrey Jones','Swallow@area52','Peter Hollaubek','Michael Kinasz','Kelly Wolf','Sam Ramji','Syed Hamdani','Raidek ','Thinkdesigner '}}} -- generated patron list
local FOOTER = 'Copyright 2008-2023 João Cardoso'


--[[ Startup ]]--

function Options:OnEnable()
	local credits = LibStub('Sushi-3.1').CreditsGroup(self, PATRONS, 'Patrons |TInterface/Addons/Blitz/art/patreon:12:12|t')
	credits:SetSubtitle(L.Supporters:format('|cFFF96854patreon.com/jaliborc|r'), 'http://www.patreon.com/jaliborc')
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
