local L = Blitz.Locals
local Language = GetLocale()

-- Portuguese --
if Language == 'ptBR' then
    L.GeneralDescription = "Por padrão, o Blitz automatiza apenas missões diárias e repetíveis de sua escolha. Essas opções permitem que você mude quando e quais missões ele automatiza."
    L.PatronsDescription = "O Blitz é distribuído gratuitamente e é sustentado através de doações. Um enorme agradecimento a todos os apoiadores no Patreon e Paypal que mantêm o desenvolvimento ativo. Você também pode se tornar um patrono em |cFFF96854patreon.com/jaliborc|r."

    L.Welcome = "Bem-vindo ao Blitz!"
    L.Tutorial1 = "Você está usando o |cffffd200Blitz|r, de |cffffd200Jaliborc|r, um addon que aceita e entrega missões automaticamente para você.|n|nPor padrão, o |cffffd200Blitz|r automatiza apenas missões diárias, semanais e repetíveis de sua escolha. Você pode selecioná-las clicando no botão |cffffd200Automatizar Missão|r ao falar com o doador da missão."
    L.Tutorial2 = "E se você quiser que o Blitz entregue todas as missões concluídas para você, não apenas as diárias? Ou para selecionar automaticamente a recompensa mais valiosa?|n|nEssas e muitas outras opções estão disponíveis no |cffffd200Menu do Jogo|r em |cffffd200Opções de Interface|r."

    L.Accept = "Aceitar Todas as Missões"
    L.AcceptTip = "Se ativado, o Blitz aceitará qualquer missão diária ou repetível disponível."
    L.Deliver = "Entregar Missões Concluídas"
    L.DeliverTip = "Se ativado, o Blitz entregará qualquer missão diária ou repetível concluída."
    L.SelectReward = "Selecionar Recompensa"
    L.SelectRewardTip = "Se ativado, o Blitz escolherá automaticamente a recompensa mais valiosa ao entregar missões."

    L.Manual = "Requerir Tecla"
    L.ManualTip = "Se ativado, as missões só serão automatizadas se você segurar a tecla abaixo."
    L.AutomateKey = "Tecla de Automação"
    L.AutomateKeyTip = "Segure para permitir que as missões sejam automatizadas."
    L.ManualKey = "Tecla Manual"
    L.ManualKeyTip = "Segure para evitar que as missões sejam automatizadas."

-- Spanish --
elseif Language == 'esES' or Language == 'esMX' then
    L.GeneralDescription = "Por defecto, Blitz sólo automatiza misiones diarias y repetibles de tu elección. Estas opciones te permiten cambiar cuándo y qué misiones automatiza."
    L.PatronsDescription = "Blitz se distribuye de forma gratuita y se mantiene a través de donaciones. Un enorme agradecimiento a todos los patrocinadores en Patreon y Paypal que mantienen vivo el desarrollo. También puedes convertirte en patrocinador en |cFFF96854patreon.com/jaliborc|r."

    L.Welcome = "¡Bienvenido a Blitz!"
    L.Tutorial1 = "Ahora estás usando |cffffd200Blitz|r, de |cffffd200Jaliborc|r, un complemento que acepta y entrega misiones automáticamente para ti.|n|nPor defecto, |cffffd200Blitz|r sólo automatiza misiones diarias, semanales y repetibles de tu elección. Puedes seleccionarlas haciendo clic en el botón |cffffd200Automatizar Misión|r cuando hables con el proveedor de la misión."
    L.Tutorial2 = "¿Y si quieres que Blitz entregue todas las misiones completadas para ti, no sólo las diarias? ¿O para seleccionar automáticamente la recompensa más valiosa?|n|nEstas y muchas otras opciones están disponibles en el |cffffd200Menú del Juego|r en |cffffd200Opciones de Interfaz|r."

    L.Accept = "Aceptar Todas las Misiones"
    L.AcceptTip = "Si está habilitado, Blitz aceptará cualquier misión diaria o repetible disponible."
    L.Deliver = "Entregar Misiones Completadas"
    L.DeliverTip = "Si está habilitado, Blitz entregará cualquier misión diaria o repetible completada."
    L.SelectReward = "Seleccionar Recompensa"
    L.SelectRewardTip = "Si está habilitado, Blitz elegirá automáticamente la recompensa más valiosa al entregar misiones."

    L.Manual = "Requiere Tecla"
    L.ManualTip = "Si está habilitado, las misiones sólo se automatizarán si mantienes presionada la tecla de abajo."
    L.AutomateKey = "Tecla de Automatización"
    L.AutomateKeyTip = "Mantén presionado para permitir que las misiones se automaticen."
    L.ManualKey = "Tecla Manual"
    L.ManualKeyTip = "Mantén presionado para evitar que las misiones se automaticen."

-- German --
elseif Language == 'deDE' then
    L.GeneralDescription = "Standardmäßig automatisiert Blitz nur tägliche und wiederholbare Quests deiner Wahl. Diese Optionen ermöglichen es dir, zu ändern, wann und welche Quests automatisiert werden."
    L.PatronsDescription = "Blitz wird kostenlos verteilt und durch Spenden unterstützt. Ein riesiges Dankeschön an alle Unterstützer auf Patreon und Paypal, die die Entwicklung am Leben erhalten. Du kannst auch ein Patron werden unter |cFFF96854patreon.com/jaliborc|r."

    L.Welcome = "Willkommen bei Blitz!"
    L.Tutorial1 = "Du benutzt jetzt |cffffd200Blitz|r von |cffffd200Jaliborc|r, ein Addon, das automatisch Quests für dich annimmt und abgibt.|n|nStandardmäßig automatisiert |cffffd200Blitz|r nur tägliche, wöchentliche und wiederholbare Quests deiner Wahl. Du kannst sie auswählen, indem du auf die |cffffd200Quest automatisieren|r Schaltfläche klickst, wenn du mit dem Questgeber sprichst."
    L.Tutorial2 = "Was ist, wenn du möchtest, dass Blitz alle abgeschlossenen Quests für dich abgibt, nicht nur die täglichen? Oder automatisch die wertvollste Belohnung auswählt?|n|nDiese und viele andere Optionen findest du im |cffffd200Spielmenü|r unter den |cffffd200Interface-Optionen|r."

    L.Accept = "Alle Quests annehmen"
    L.AcceptTip = "Wenn aktiviert, wird Blitz alle verfügbaren täglichen oder wiederholbaren Quests annehmen."
    L.Deliver = "Abgeschlossene Quests abgeben"
    L.DeliverTip = "Wenn aktiviert, wird Blitz alle abgeschlossenen täglichen oder wiederholbaren Quests abgeben."
    L.SelectReward = "Belohnung auswählen"
    L.SelectRewardTip = "Wenn aktiviert, wird Blitz automatisch die wertvollste Belohnung auswählen, wenn Quests abgegeben werden."

    L.Manual = "Taste erforderlich"
    L.ManualTip = "Wenn aktiviert, werden Quests nur automatisiert, wenn du die untenstehende Taste gedrückt hältst."
    L.AutomateKey = "Automatisierungstaste"
    L.AutomateKeyTip = "Halten, um die Automatisierung von Quests zu ermöglichen."
    L.ManualKey = "Manuelle Taste"
    L.ManualKeyTip = "Halten, um die Automatisierung von Quests zu verhindern."

-- Italian --
elseif Language == 'itIT' then
    L.GeneralDescription = "Di default, Blitz automatizza solo missioni quotidiane e ripetibili a tua scelta. Queste opzioni ti permettono di cambiare quando e quali missioni vengono automatizzate."
    L.PatronsDescription = "Blitz è distribuito gratuitamente e supportato attraverso donazioni. Un enorme ringraziamento a tutti i sostenitori su Patreon e Paypal che mantengono vivo lo sviluppo. Anche tu puoi diventare un patrono su |cFFF96854patreon.com/jaliborc|r."

    L.Welcome = "Benvenuto in Blitz!"
    L.Tutorial1 = "Ora stai usando |cffffd200Blitz|r, di |cffffd200Jaliborc|r, un addon che accetta e consegna automaticamente missioni per te.|n|nDi default, |cffffd200Blitz|r automatizza solo missioni quotidiane, settimanali e ripetibili a tua scelta. Puoi selezionarle cliccando sul pulsante |cffffd200Automatizza Missione|r quando parli con il donatore della missione."
    L.Tutorial2 = "E se vuoi che Blitz consegni tutte le missioni completate per te, non solo quelle quotidiane? O per selezionare automaticamente la ricompensa più preziosa?|n|nQueste e molte altre opzioni sono disponibili nel |cffffd200Menu di Gioco|r nelle |cffffd200Opzioni Interfaccia|r."

    L.Accept = "Accetta Tutte le Missioni"
    L.AcceptTip = "Se abilitato, Blitz accetterà qualsiasi missione quotidiana o ripetibile disponibile."
    L.Deliver = "Consegna Missioni Completate"
    L.DeliverTip = "Se abilitato, Blitz consegnerà qualsiasi missione quotidiana o ripetibile completata."
    L.SelectReward = "Seleziona Ricompensa"
    L.SelectRewardTip = "Se abilitato, Blitz sceglierà automaticamente la ricompensa più preziosa quando consegni missioni."

    L.Manual = "Richiedi Tasto"
    L.ManualTip = "Se abilitato, le missioni saranno automatizzate solo se tieni premuto il tasto sottostante."
    L.AutomateKey = "Tasto Automazione"
    L.AutomateKeyTip = "Tieni premuto per permettere l'automazione delle missioni."
    L.ManualKey = "Tasto Manuale"
    L.ManualKeyTip = "Tieni premuto per prevenire l'automazione delle missioni."

-- French --
elseif Language =='frFR' then
	L.GeneralDescription = "Par défaut, Blitz n'automatise que les quêtes journalières et répétables de votre choix. Ces options vous permettent de changer quelles quêtes et quand il les automatise."
	L.PatronsDescription = "Blitz est distribué gratuitement et est soutenu par des donations. Un grand merci à tous les supporters sur Patreon et Paypal qui maintiennent le développement. Vous pouvez devenir un patron également à |cFFF96854patreon.com/jaliborc|r."
	
	L.Welcome = "Bienvenue dans Blitz!"
	L.Tutorial1 = "Vous utilisez désormais |cffffd200Blitz|r, de |cffffd200Jaliborc|r, un addon qui accepte et rend automatiquement les quêtes pour vous.|n|nPar défaut, |cffffd200Blitz|r n'automatise que les quêtes journalières, hebdomadaires et répétables de votre choix. Vous pouves les sélectionner en cliquant sur le bouton |cffffd200Automatiser Quête|r en parlant au donneur de quête."
	L.Tutorial2 = "Si vous souhaitez que Blitz rende toutes vos quêtes, pas seulement les journalières? Ou qu'il sélectionne automatiquement l'objet de plus grande valeur?|n|nCes options et bien d'autres sont disponibles dans le |cffffd200Menu de jeu|r dans les |cffffd200Options d'Interface|r."
	
	L.Accept = "Accepter les quêtes"
	L.AcceptTip = "Si activée, Blitz acceptera toute quête disponible."
	L.Deliver = "Rendre les quêtes"
	L.DeliverTip = "Si activée, Blitz rendra toute quête terminée."
	L.SelectReward = "Sélectionner une récompense"
	L.SelectRewardTip = "Si activée, Blitz choisira la récompense de plus grande valeur en rendant les quêtes."
	
	L.Manual = "Mode Manuel / Touche requise"
	L.ManualTip = "Si activée, les quêtes ne seront automatisées que si vous maintenez la touche ci-dessous."
	L.AutomateKey = "Touche Automatisation"
	L.AutomateKeyTip = "Maintenir pour permettre aux quêtes d'être automatisées."
	L.ManualKey = "Touche Manuelle"
	L.ManualKeyTip = "Maintenir pour éviter que les quêtes ne soient automatisées."

-- Traditional Chinese --
elseif Language == 'zhTW' then
    L.GeneralDescription = "Blitz預設僅接受每日或重複任務，此選項可以調整設定。"
    L.PatronsDescription = "Blitz是免費發佈的，並通過捐款獲得支持。在Patreon和Paypal上的所有支持者都非常感謝，他們讓這個項目能夠持續發展。您也可以在%s成為其中一員。"

    L.Welcome = "歡迎使用Blitz!"
    L.Tutorial1 = "您正在使用由 |cffffd200Jaliborc|r 創作的 |cffffd200Blitz|r 插件|n|n 在預設情況下 |cffffd200Blitz|r 僅自動接受每日任務、每週任務或重複任務，您可在任務給予者畫面點擊 |cffffd200自動任務|r 按鈕來開啟功能。"
    L.Tutorial2 = "如果您希望Blitz為您交付所有已完成的任務，而不僅僅是每日任務？或者自動選擇最有價值的獎勵？|n|n這些以及其他許多選項都可以在 |cffffd200遊戲菜單|r 的 |cffffd200界面選項|r 中找到。"

    L.Accept = "接受所有任務"
    L.AcceptTip = "如果啟用，Blitz將接受任何可用的每日或重複任務。"
    L.Deliver = "繳交已完成的任務"
    L.DeliverTip = "如果啟用，Blitz將交付任何已完成的每日或重複任務。"
    L.SelectReward = "選擇獎勵"
    L.SelectRewardTip = "如果啟用，Blitz將自動選擇交付任務時最有價值的獎勵。"

    L.Manual = "需要手動鍵"
    L.ManualTip = "如果啟用，只有在您按住下面的鍵時，任務才會被自動化。"
    L.AutomateKey = "自動鍵"
    L.AutomateKeyTip = "按住以允許任務被自動化。"
    L.ManualKey = "手動鍵"
    L.ManualKeyTip = "按住以防止任務被自動化。"

-- Simplified Chinese --
elseif Language == 'zhCN' then
    L.GeneralDescription = "Blitz预设仅接受每日或重复任务，此选项可以调整设定。"
    L.PatronsDescription = "Blitz是免费发布的，并通过捐款获得支持。在Patreon和Paypal上的所有支持者都非常感谢，他们让这个项目能够持续发展。您也可以在%s成为其中一员。"

    L.Welcome = "欢迎使用Blitz!"
    L.Tutorial1 = "您正在使用由 |cffffd200Jaliborc|r 创作的 |cffffd200Blitz|r 插件|n|n 在预设情况下 |cffffd200Blitz|r 仅自动接受日常任务、周常任务或重复任务，您可在任务给予者画面点击 |cffffd200自动任务|r 按钮来开启功能。"
    L.Tutorial2 = "如果您希望Blitz为您交付所有已完成的任务，而不仅仅是日常任务？或者自动选择最有价值的奖励？|n|n这些以及其他许多选项都可以在 |cffffd200游戏菜单|r 的 |cffffd200界面选项|r 中找到。"

    L.Accept = "接受所有任务"
    L.AcceptTip = "如果启用，Blitz将接受任何可用的日常或重复任务。"
    L.Deliver = "缴交已完成的任务"
    L.DeliverTip = "如果启用，Blitz将交付任何已完成的日常或重复任务。"
    L.SelectReward = "选择奖励"
    L.SelectRewardTip = "如果启用，Blitz将自动选择交付任务时最有价值的奖励。"

    L.Manual = "需要手动键"
    L.ManualTip = "如果启用，只有在您按住下面的键时，任务才会被自动化。"
    L.AutomateKey = "自动键"
    L.AutomateKeyTip = "按住以允许任务被自动化。"
    L.ManualKey = "手动键"
    L.ManualKeyTip = "按住以防止任务被自动化。"

-- Korean
elseif Language == 'koKR' then
    L.GeneralDescription = "기본적으로 Blitz는 당신이 선택한 일일 및 반복 퀘스트만 자동화합니다. 이 옵션을 사용하면 언제, 어떤 퀘스트를 자동화할지 변경할 수 있습니다."
    L.PatronsDescription = "Blitz는 무료로 배포되며 기부를 통해 지원됩니다. Patreon과 Paypal에서 지원해 주신 모든 분께 깊은 감사를 드립니다. %s에서 후원자가 될 수도 있습니다."

    L.Welcome = "Blitz에 오신 것을 환영합니다!"
    L.Tutorial1 = "당신은 지금 |cffffd200Jaliborc|r의 |cffffd200Blitz|r 애드온을 사용하고 있습니다.|n|n기본적으로 |cffffd200Blitz|r는 당신이 선택한 일일, 주간, 반복 퀘스트만 자동화합니다. 퀘스트 제공자와 대화할 때 |cffffd200퀘스트 자동화|r 버튼을 클릭하여 선택할 수 있습니다."
    L.Tutorial2 = "Blitz가 일일 퀘스트 외에도 모든 완료된 퀘스트를 자동으로 제출하길 원하시나요? 또는 자동으로 가장 가치 있는 보상을 선택하게 하고 싶으신가요?|n|n이러한 옵션과 다른 많은 옵션은 |cffffd200게임 메뉴|r의 |cffffd200인터페이스 옵션|r에서 사용할 수 있습니다."

    L.Accept = "모든 퀘스트 수락"
    L.AcceptTip = "활성화하면, Blitz는 모든 가능한 일일이나 반복 퀘스트를 수락합니다."
    L.Deliver = "완료된 퀘스트 제출"
    L.DeliverTip = "활성화하면, Blitz는 모든 완료된 일일이나 반복 퀘스트를 제출합니다."
    L.SelectReward = "보상 선택"
    L.SelectRewardTip = "활성화하면, 퀘스트를 제출할 때 Blitz는 자동으로 가장 가치 있는 보상을 선택합니다."

    L.Manual = "키 필요"
    L.ManualTip = "활성화하면, 아래의 키를 누르고 있을 때만 퀘스트가 자동화됩니다."
    L.AutomateKey = "자동화 키"
    L.AutomateKeyTip = "퀘스트를 자동화하도록 허용하기 위해 누르고 있습니다."
    L.ManualKey = "수동 키"
    L.ManualKeyTip = "퀘스트 자동화를 방지하기 위해 누르고 있습니다."
	
-- Russian --
elseif Language =='ruRU' then
	L.GeneralDescription = "По умолчанию, Блиц только автоматизирует каждодневные и повторяющиеся задания. Эти настройки позволяют Вам изменить поведение Блица - когда и какие задания он будет автоматизировать."
	L.PatronsDescription = "Блиц распространяется бесплатно и поддерживается через пожертвования. Огромное спасибо всем поддерживающим на Patreon и Paypal, которые поддерживают разработку. Вы тоже можете стать покровителем на |cFFF96854patreon.com/jaliborc|r."
	
	L.Welcome = "Добро пожаловать в Блиц!"
	L.Tutorial1 = "Теперь Вы используете |cffffd200Блиц|r, от |cffffd200Jaliborc|r, аддон, который автоматически получает и сдает задания за Вас.|n|nПо умолчанию, |cffffd200Блиц|r автоматизирует только ежедневные, еженедельные и повторяющиеся задания по Вашему выбору. Вы можете выбирать их, кликнув на кнопке |cffffd200Автоматизировать задание|r, когда разговариваете с квестодателем."
	L.Tutorial2 = "Что, если Вы хотите, чтобы Блиц сдавал все завершенные задания за Вас? Или автоматически выбирал самую дорогую награду?|n|nЭти и многие другие настройки Вы можете найти в |cffffd200Игровом меню|r в |cffffd200Настройках интерфейса|r."
	
	L.Accept = "Принимать задания"
	L.AcceptTip = "Если включено, Блиц будет принимать любые доступные задания"
	L.Deliver = "Сдавать задания"
	L.DeliverTip = "Если включено, Блиц будет сдавать любые завершенные задания"
	L.SelectReward = "Выберите награду"
	L.SelectRewardTip = "Если включено, Блиц выберет самую дорогостоящую награду при сдаче задания."
	
	L.Manual = "Необходима клавиша"
	L.ManualTip = "Если включено, задания будут автоматизированы только когда Вы зажмете клавишу, указанную ниже."
	L.AutomateKey = "Клавиша автоматизации"
	L.AutomateKeyTip = "Зажмите, чтобы задания были автоматизированы"
	L.ManualKey = "Ручная клавиша"
	L.ManualKeyTip = "Зажмите, чтобы предотвратить автоматизацию заданий"

-- English --
else
	L.GeneralDescription = 'By default, Blitz only automates daily and repeatable quests of your choice. These options allow you to change when and which quests it automates.'
    L.PatronsDescription = 'Blitz is distributed for free and supported trough donations. A massive thank you to all the supporters on Patreon and Paypal who keep development alive. You can become a patron too at |cFFF96854patreon.com/jaliborc|r.'

	L.Welcome = 'Welcome to Blitz!'
	L.Tutorial1 = 'You are now using |cffffd200Blitz|r, by |cffffd200Jaliborc|r, an addon which automatically accepts and delivers quests for you.|n|nBy default, |cffffd200Blitz|r only automates daily, weekly and repeatable quests of your choice. You can select them by clicking on the |cffffd200Automate Quest|r button when talking to the quest giver.'
	L.Tutorial2 = 'What if you want Blitz to deliver all completed quests for you, not only the daily ones? Or to automatically select the most valuable reward?|n|nThese and many other options are available at the |cffffd200Game Menu|r at the |cffffd200Interface Options|r.'

	L.Accept = 'Accept All Quests'
	L.AcceptTip = 'If enabled, Blitz will accept any available daily or repeatable quest.'
	L.Deliver = 'Deliver Completed Quests'
	L.DeliverTip = 'If enabled, Blitz will deliver any daily or repeatable completed quest.'
	L.SelectReward = 'Select Reward'
	L.SelectRewardTip = 'If enabled, Blitz will automatically choose the most valuable reward when delivering quests.'
    L.Warband = 'Automate If Warband-Complete'
    L.WarbandTip = 'If enabled, Blitz will automate quests that your other characters have completed.'

	L.Manual = 'Require Key'
	L.ManualTip = 'If enabled, quests will only be automated if you hold the key below.'
	L.AutomateKey = 'Automate Key'
	L.AutomateKeyTip = 'Hold to allow quests to be automated.'
	L.ManualKey = 'Manual Key'
	L.ManualKeyTip = 'Hold to prevent quests from being automated.'
end
