--[[
Copyright 2009-2024 João Cardoso
All Rights Reserved
--]]

local Sushi = LibStub('Sushi-3.2')
local Options = Blitz:NewModule('Options', Sushi.OptionsGroup('|TInterface/PVPFrame/Icons/prestige-icon-4-1:16:16:0:0|t Blitz'))
local L = Blitz.Locals

local PATRONS = {{title='Jenkins',people={'Gnare','Debora S Ogormanw','Johnny Rabbit','Shaun Potts'}},{title='Ambassador',people={'Julia F','Lolari ','Rafael Lins','Dodgen','Ptsdthegamer','Adam Mann','Bc Spear','Jury ','Swallow@area52','Peter Hollaubek','Michael Kinasz','Metadata','Ds9293','Kelly Wolf','Charles Howarth','Lisa','M Prieto','נעמי מקינו'}}} -- generated patron list
local PATREON_ICON = '  |TInterface/Addons/Blitz/art/patreon:12:12|t'
local FOOTER = 'Copyright 2008-2024 João Cardoso'


--[[ Startup ]]--

function Options:OnEnable()
	self.Credits = Sushi.OptionsGroup(self, 'Patrons' .. PATREON_ICON)
		:SetSubtitle(L.PatronsDescription):SetFooter(FOOTER):SetOrientation('HORIZONTAL'):SetChildren(self.OnCredits)
	
	self:SetFooter(FOOTER)
	self:SetSubtitle(L.GeneralDescription)
	self:SetCall('OnChildren', self.OnMain)
end

function Options:OnMain()
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

function Options:OnCredits()
	for i, rank in ipairs(PATRONS) do
		if rank.people then
			self:Add('Header', rank.title, GameFontHighlight, true).top = i > 1 and 20 or 0

			for j, name in ipairs(rank.people) do
				self:Add('Header', name, i > 1 and GameFontHighlight or GameFontHighlightLarge):SetWidth(180)
			end
		end
	end

	self:AddBreak()
	self:Add('RedButton', 'Join Us'):SetWidth(200):SetCall('OnClick', function()
		Sushi.Popup:External('patreon.com/jaliborc')
		SettingsPanel:Close(true)
	end).top = 20
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
