;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname AFT:Fragments:Terminals:TERM_TweakFollowerLimitTermi_0100B039 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
int current = 0
AFT:TweakDFScript pTweakDFScript = (pFollowers as AFT:TweakDFScript)
if pTweakDFScript
    current = pTweakDFScript.CountFilledAliases()
endif
if (current > 1)
    pTweakLimitChangeFail.Show()
else
    pTweakFollowerLimit.SetValue(1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
int current = 0
AFT:TweakDFScript pTweakDFScript = (pFollowers as AFT:TweakDFScript)
if pTweakDFScript
    current = pTweakDFScript.CountFilledAliases()
endif
if (current > 2)
    pTweakLimitChangeFail.Show()
else
    pTweakFollowerLimit.SetValue(2)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
int current = 0
AFT:TweakDFScript pTweakDFScript = (pFollowers as AFT:TweakDFScript)
if pTweakDFScript
    current = pTweakDFScript.CountFilledAliases()
endif
if (current > 3)
    pTweakLimitChangeFail.Show()
else
    pTweakFollowerLimit.SetValue(3)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
int current = 0
AFT:TweakDFScript pTweakDFScript = (pFollowers as AFT:TweakDFScript)
if pTweakDFScript
    current = pTweakDFScript.CountFilledAliases()
endif
if (current > 4)
    pTweakLimitChangeFail.Show()
else
    pTweakFollowerLimit.SetValue(4)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
int current = 0
AFT:TweakDFScript pTweakDFScript = (pFollowers as AFT:TweakDFScript)
if pTweakDFScript
    current = pTweakDFScript.CountFilledAliases()
endif
if (current > 5)
    pTweakLimitChangeFail.Show()
else
    pTweakFollowerLimit.SetValue(5)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_06
Function Fragment_Terminal_06(ObjectReference akTerminalRef)
;BEGIN CODE
int current = 0
AFT:TweakDFScript pTweakDFScript = (pFollowers as AFT:TweakDFScript)
if pTweakDFScript
    current = pTweakDFScript.CountFilledAliases()
endif
if (current > 6)
    pTweakLimitChangeFail.Show()
else
    pTweakFollowerLimit.SetValue(6)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_07
Function Fragment_Terminal_07(ObjectReference akTerminalRef)
;BEGIN CODE
int current = 0
AFT:TweakDFScript pTweakDFScript = (pFollowers as AFT:TweakDFScript)
if pTweakDFScript
    current = pTweakDFScript.CountFilledAliases()
endif
if (current > 7)
    pTweakLimitChangeFail.Show()
else
    pTweakFollowerLimit.SetValue(7)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_08
Function Fragment_Terminal_08(ObjectReference akTerminalRef)
;BEGIN CODE
int current = 0
AFT:TweakDFScript pTweakDFScript = (pFollowers as AFT:TweakDFScript)
if pTweakDFScript
    current = pTweakDFScript.CountFilledAliases()
endif
if (current > 8)
    pTweakLimitChangeFail.Show()
else
    pTweakFollowerLimit.SetValue(8)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_09
Function Fragment_Terminal_09(ObjectReference akTerminalRef)
;BEGIN CODE
int current = 0
AFT:TweakDFScript pTweakDFScript = (pFollowers as AFT:TweakDFScript)
if pTweakDFScript
    current = pTweakDFScript.CountFilledAliases()
endif
if (current > 9)
    pTweakLimitChangeFail.Show()
else
    pTweakFollowerLimit.SetValue(9)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_10
Function Fragment_Terminal_10(ObjectReference akTerminalRef)
;BEGIN CODE
int current = 0
AFT:TweakDFScript pTweakDFScript = (pFollowers as AFT:TweakDFScript)
if pTweakDFScript
    current = pTweakDFScript.CountFilledAliases()
endif
if (current > 10)
    pTweakLimitChangeFail.Show()
else
    pTweakFollowerLimit.SetValue(10)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property pTweakFollowerLimit Auto Const

Quest Property pFollowers Auto Const

Message Property pTweakLimitChangeFail Auto Const
