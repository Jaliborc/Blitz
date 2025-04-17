--[[
Copyright 2009-2025 João Cardoso
All Rights Reserved
--]]

local Tutorials = Blitz:NewModule('Tutorials', 'CustomTutorials-2.1')
local L, Button = Blitz.Locals, Blitz.Button

function Tutorials:Show()
	self:Load()
	self:TriggerTutorial(2)
end

function Tutorials:Load()
	self:RegisterTutorials({
		savedvariable = Blitz.sets,
		key = 'tutorial',
		title = L.Welcome,

		{
			text = L.Tutorial1,
			image = 'Interface/Addons/Blitz/art/tutorial',
			shineTop = 4, shineBottom = -4, shineLeft = -6,
			shineRight = Button:GetTextWidth() + 10,
			shine = Button,
			point = 'TOPRIGHT',
			x = -50, y = -200,
		},
		{
			text = L.Tutorial2,
			shine = MainMenuMicroButton,
			shineTop = -21, shineBottom = 1,
			shineLeft = -2, shineRight = 2,
			point = 'TOPRIGHT',
			x = -50, y = -200,
		},
	})
end
