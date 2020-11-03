local ADDON, Addon = ...
local L = Addon:NewModule('Locals')
local Language = GetLocale()

-- Traditional Chinese --
if Language == 'zhTW' then
	L.AutomateQuest = "自動任務"

-- Simplified Chinese --
elseif Language == 'zhCN' then
	L.AutomateQuest = "自动任务"

-- Russian --
elseif Language =='ruRU' then
	L.AutomateQuest = "Автоматизировать задание"

-- French --
elseif Language =='frFR' then
	L.AutomateQuest = "Automatiser Quête"

-- English --
else
	L.AutomateQuest = 'Automate Quest'
end
