local ADDON, Addon = ...
local L = Addon:NewModule('Locals')
local Language = GetLocale()

-- Traditional Chinese --
if Language == 'zhTW' then
	L.AutomateQuest = "自動任務"
	L.AutomationOff = "任務自動化已關閉。"
	L.AutomationOn = "任務自動化已開啟。"
	L.NoQuest = "沒有可自動化的任務。"
	L.ToggleAutomation = "切換自動化"

-- Simplified Chinese --
elseif Language == 'zhCN' then
	L.AutomateQuest = "自动任务"
	L.AutomationOff = "任务自动化已关闭。"
	L.AutomationOn = "任务自动化已开启。"
	L.NoQuest = "没有可自动化的任务。"
	L.ToggleAutomation = "切换自动化"

-- Russian --
elseif Language =='ruRU' then
	L.AutomateQuest = "Автоматизировать задание"
	L.AutomationOff = "Автоматизация задания выключена."
	L.AutomationOn = "Автоматизация задания включена."
	L.NoQuest = "Нет задания для автоматизации."
	L.ToggleAutomation = "Переключить автоматизацию"

-- French --
elseif Language =='frFR' then
	L.AutomateQuest = "Automatiser Quête"
	L.AutomationOff = "Automatisation de la quête désactivée."
	L.AutomationOn = "Automatisation de la quête activée."
	L.NoQuest = "Aucune quête à automatiser."
	L.ToggleAutomation = "Activer/Désactiver l'automatisation"

-- Portuguese --
elseif Language == 'ptBR' then
	L.AutomateQuest = "Automatizar Missão"
	L.AutomationOff = "Automatização da missão desativada."
	L.AutomationOn = "Automatização da missão ativada."
	L.NoQuest = "Nenhuma missão para automatizar."
	L.ToggleAutomation = "Alternar Automação"

-- Spanish --
elseif Language == 'esES' or Language == 'esMX' then
	L.AutomateQuest = "Automatizar Misión"
	L.AutomationOff = "Automatización de misión desactivada."
	L.AutomationOn = "Automatización de misión activada."
	L.NoQuest = "No hay misión para automatizar."
	L.ToggleAutomation = "Alternar Automatización"

-- German --
elseif Language == 'deDE' then
	L.AutomateQuest = "Quest automatisieren"
	L.AutomationOff = "Automatisierung für Quest deaktiviert."
	L.AutomationOn = "Automatisierung für Quest aktiviert."
	L.NoQuest = "Keine Quest zum Automatisieren."
	L.ToggleAutomation = "Automatisierung umschalten"

-- Italian --
elseif Language == 'itIT' then
	L.AutomateQuest = "Automatizzare Missione"
	L.AutomationOff = "Automatizzazione della missione disattivata."
	L.AutomationOn = "Automatizzazione della missione attivata."
	L.NoQuest = "Nessuna missione da automatizzare."
	L.ToggleAutomation = "Attiva/Disattiva Automazione"

-- Korean --
elseif Language == 'koKR' then
	L.AutomateQuest = "퀘스트 자동화"
	L.AutomationOff = "퀘스트 자동화가 꺼졌습니다."
	L.AutomationOn = "퀘스트 자동화가 켜졌습니다."
	L.NoQuest = "자동화할 퀘스트가 없습니다."
	L.ToggleAutomation = "자동화 전환"

-- Dutch --
elseif Language == 'nlNL' then
	L.AutomateQuest = "Automatiseer Quest"
	L.AutomationOff = "Automatisering voor quest is uitgeschakeld."
	L.AutomationOn = "Automatisering voor quest is ingeschakeld."
	L.NoQuest = "Geen quest om te automatiseren."
	L.ToggleAutomation = "Automatisering in-/uitschakelen"

-- English --
else
	L.AutomateQuest = 'Automate Quest'
	L.AutomationOff = 'Automation for quest is off.'
	L.AutomationOn = 'Automation for quest is on.'
	L.NoQuest = 'No quest to automate.'
	L.ToggleAutomation = 'Toggle Automation'
end

BINDING_NAME_BLITZ_TOGGLE = L.ToggleAutomation