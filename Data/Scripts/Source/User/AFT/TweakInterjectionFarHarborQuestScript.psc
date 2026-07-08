Scriptname AFT:TweakInterjectionFarHarborQuestScript extends Quest

TweakDLC03Interjections			Property pTweakDLC03Interjections				Auto Const
GlobalVariable						Property pTweakAllowMultInterjections 			Auto Const

int NO_LOAD_FLOOD = 200 const

bool Function Trace(string asTextToPrint, int aiSeverity = 0) debugOnly
	debug.OpenUserLog("TweakInterjectionQuestScript")
	RETURN debug.TraceUser("TweakInterjectionQuestScript", asTextToPrint, aiSeverity)
EndFunction

; Called from TweakMonitorPlayer
Function OnGameLoaded(bool firstTime=false)
	;debug.notification("Unregistering Interjections")
	UnRegisterInterjections()
	;debug.notification("Registering Interjections")
	RegisterInterjections()
	Trace("OnGameLoaded() Called")
	;StartTimer(4.0, NO_LOAD_FLOOD)
EndFunction

Event OnInit()
	Trace("OnInit() Called")
EndEvent

Event OnQuestInit()
	Trace("OnQuestInit() Called")
EndEvent

Event Actor.OnPlayerLoadGame(Actor akSender)

	; 1.18 : Left in for stray events from previous versions
	; of the mod. We now rely on TweakMonitorPlayer to call 
	; OnGameLoaded. This ensures we dont register for 
	; interjections before the rest of the mod has initialized. 
	
	Trace("OnPlayerLoadGame Called")
	UnRegisterForRemoteEvent(Game.GetPlayer(),"OnPlayerLoadGame")	
	
EndEvent

Event OnTimer(int timerID)
	CancelTimer(timerID)
	if (NO_LOAD_FLOOD == timerID)
		Trace("OnTimer : NO_LOAD_FLOOD")
		if (1.0 == pTweakAllowMultInterjections.GetValue())	
			UnRegisterInterjections()
			RegisterInterjections()
		endif
		return
	endif
EndEvent

Function UnRegisterInterjections()
	Trace("UnRegisterInterjections")
	pTweakDLC03Interjections.UnRegisterInterjections()
EndFunction

Function RegisterInterjections()
	if (1.0 == pTweakAllowMultInterjections.GetValue())	
		pTweakDLC03Interjections.RegisterInterjections()
	endif
EndFunction
