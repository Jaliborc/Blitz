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

-- Portuguese --
elseif Language == 'ptBR' then
	L.AutomateQuest = "Automatizar Missão"

-- Spanish --
elseif Language == 'esES' or Language == 'esMX' then
	L.AutomateQuest = "Automatizar Misión"

-- German --
elseif Language == 'deDE' then
	L.AutomateQuest = "Quest automatisieren"

-- Italian --
elseif Language == 'itIT' then
	L.AutomateQuest = "Automatizzare Missione"

-- Korean --
elseif Language == 'koKR' then
	L.AutomateQuest = "퀘스트 자동화"

-- Dutch --
elseif Language == 'nlNL' then
	L.AutomateQuest = "Automatiseer Quest"

-- English --
else
	L.AutomateQuest = 'Automate Quest'
end
