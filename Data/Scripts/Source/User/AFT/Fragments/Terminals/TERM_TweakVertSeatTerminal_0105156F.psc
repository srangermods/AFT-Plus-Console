;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname AFT:Fragments:Terminals:TERM_TweakVertSeatTerminal_0105156F Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
AFT:TweakPipBoyScript pTweakPipBoyScript = (pTweakPipBoy as AFT:TweakPipBoyScript)
if (pTweakPipBoyScript)
	;set passenger seat
    pTweakPipBoyScript.setVertibirdSeat(0)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
AFT:TweakPipBoyScript pTweakPipBoyScript = (pTweakPipBoy as AFT:TweakPipBoyScript)
if (pTweakPipBoyScript)
	;set copilot seat
    pTweakPipBoyScript.setVertibirdSeat(1)
endif
;END CODE
EndFunction

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
AFT:TweakPipBoyScript pTweakPipBoyScript = (pTweakPipBoy as AFT:TweakPipBoyScript)
if (pTweakPipBoyScript)
	;set left standing seat
    pTweakPipBoyScript.setVertibirdSeat(2)
endif
;END CODE
EndFunction

;BEGIN FRAGMENT Fragment_Terminal_06
Function Fragment_Terminal_06(ObjectReference akTerminalRef)
;BEGIN CODE
AFT:TweakPipBoyScript pTweakPipBoyScript = (pTweakPipBoy as AFT:TweakPipBoyScript)
if (pTweakPipBoyScript)
	;set right standing seat
    pTweakPipBoyScript.setVertibirdSeat(3)
endif
;END CODE
EndFunction


Quest Property pTweakPipBoy Auto Const