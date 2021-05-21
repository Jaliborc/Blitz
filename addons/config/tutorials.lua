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
