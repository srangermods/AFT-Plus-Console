;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_TestStimComment_0002B7A7 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Quest __temp = self as Quest
AFT:AFT_RefHolder kmyQuest = __temp as AFT:AFT_RefHolder

debug.trace(self + "Stage 0, startup")
debug.trace(self + "Stage 0, myActor: " + Alias_myActor.getActorReference())
debug.trace(self + "Stage 0, myObject: " + Alias_myObject.getReference())

;UFO4P 2.0.2 Bug #22816: Store refs on the helper script, so the stop fragment can use them when the aliases are already cleared:
kmyQuest.Ref1 =  Alias_myObject.getReference()
kmyQuest.Ref2 =  Alias_myActor.getReference()

;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE

Actor[] followers = new Actor[0]
if Alias_myActor1
	followers.add(Alias_myActor1.GetActorReference())
endif
if Alias_myActor2
	followers.add(Alias_myActor2.GetActorReference())
endif
if Alias_myActor3
	followers.add(Alias_myActor3.GetActorReference())
endif
if Alias_myActor4
	followers.add(Alias_myActor4.GetActorReference())
endif
if Alias_myActor5
	followers.add(Alias_myActor5.GetActorReference())
endif
if Alias_myActor6
	followers.add(Alias_myActor6.GetActorReference())
endif
if Alias_myActor7
	followers.add(Alias_myActor7.GetActorReference())
endif
if Alias_myActor8
	followers.add(Alias_myActor8.GetActorReference())
endif
if Alias_myActor9
	followers.add(Alias_myActor9.GetActorReference())
endif
if Alias_myActor10
	followers.add(Alias_myActor10.GetActorReference())
endif

Actor passedInActor = Alias_myActor.GetActorReference()

int maxwait = 70 
while ( (playerref).isinScene() || (followers[0].isTalking() || followers[1].isTalking() || followers[2].isTalking() || followers[3].isTalking() || followers[4].isTalking() || followers[5].isTalking() || followers[6].isTalking() || followers[7].isTalking() || followers[8].isTalking()  || followers[9].isTalking() )  && maxwait > 0)
	Utility.wait(0.5)
	maxwait -= 1
endwhile


(Alias_myObject.GetReference() as AttractionObjectScript).SayMyThing(passedInActor)
trace(self,"Passed in Actor: "+ passedInActor + " - QF_TestStimComment_0002B7A7 said line for: "+Alias_myObject)

maxwait = 70
if passedInActor.isTalking() || passedInActor.isInScene()
	while (passedInActor.IsTalking() && maxwait > 0)
		Utility.wait(0.5)
		maxwait -= 1
	endwhile
endif

int i = 0
while (i < followers.length)
	maxwait = 70
	Utility.wait(1)
	if !(followers[i] == passedInActor)
		while ( (playerref).isinScene() || (followers[0].isTalking() || followers[1].isTalking() || followers[2].isTalking() || followers[3].isTalking() || followers[4].isTalking() || followers[5].isTalking() || followers[6].isTalking() || followers[7].isTalking() || followers[8].isTalking()  || followers[9].isTalking() )  && maxwait > 0)
			Utility.wait(0.5)
			maxwait -= 1
		endwhile
		trace(self, followers[i] + " - QF_TestStimComment_0002B7A7 said line for: "+Alias_myObject)
		(Alias_myObject.GetReference() as AttractionObjectScript).SayMyThing(followers[i])
	endif
	i +=1
endwhile

;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()

Quest __temp = self as Quest
AFT:AFT_RefHolder kmyQuest = __temp as AFT:AFT_RefHolder
;BEGIN CODE
debug.trace(self + "Stage 255, shutdown")
Actor passedInActor = kmyQuest.Ref2 as actor
;(Alias_myObject.GetReference() as AttractionObjectScript).DoMyThing(passedInActor)
;UFO4P 2.0.2 Bug #22816: replaced the previous line with the following code:
;Get the refs from the helper script (where they were stored by the startup fragment). Due to the 'run on stop' flag on this
;fragment, the quest will have cleared its aliases already if this code runs, and trying to access them will fail.
AttractionObjectScript AOS = kmyQuest.Ref1 as AttractionObjectScript
if AOS
	AOS.DoMyThing(kmyQuest.Ref2 as actor)
endif

Actor[] followers = new Actor[0]
if Alias_myActor1
	followers.add(Alias_myActor1.GetActorReference())
endif
if Alias_myActor2
	followers.add(Alias_myActor2.GetActorReference())
endif
if Alias_myActor3
	followers.add(Alias_myActor3.GetActorReference())
endif
if Alias_myActor4
	followers.add(Alias_myActor4.GetActorReference())
endif
if Alias_myActor5
	followers.add(Alias_myActor5.GetActorReference())
endif
if Alias_myActor6
	followers.add(Alias_myActor6.GetActorReference())
endif
if Alias_myActor7
	followers.add(Alias_myActor7.GetActorReference())
endif
if Alias_myActor8
	followers.add(Alias_myActor8.GetActorReference())
endif
if Alias_myActor9
	followers.add(Alias_myActor9.GetActorReference())
endif
if Alias_myActor10
	followers.add(Alias_myActor10.GetActorReference())
endif

int maxwait = 70 ; 
if passedInActor.isTalking() || passedInActor.isInScene()
	while (passedInActor.IsTalking() && maxwait > 0)
		Utility.wait(0.5)
		maxwait -= 1
	endwhile
endif

int i = 0
while (i != followers.length)
	if !(followers[i] == passedInActor)
		(Alias_myObject.GetReference() as AttractionObjectScript).DoMyThing(followers[i])
		if followers[i].isTalking() || followers[i].isInScene()
			maxwait = 70 ;
			while (followers[i].IsTalking() && maxwait > 0)
				Utility.wait(0.5)
				maxwait -= 1
			endwhile
		endif
	endif
	i +=1
endwhile
;UFO4P 2.0.2 Bug #22816: Clear all refs on the helper script
kmyQuest.ClearAll()

;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_myObject Auto Const

ReferenceAlias Property Alias_myActor Auto Const

ReferenceAlias Property Alias_myActor1 Auto Const
ReferenceAlias Property Alias_myActor2 Auto Const
ReferenceAlias Property Alias_myActor3 Auto Const
ReferenceAlias Property Alias_myActor4 Auto Const
ReferenceAlias Property Alias_myActor5 Auto Const
ReferenceAlias Property Alias_myActor6 Auto Const
ReferenceAlias Property Alias_myActor7 Auto Const
ReferenceAlias Property Alias_myActor8 Auto Const
ReferenceAlias Property Alias_myActor9 Auto Const
ReferenceAlias Property Alias_myActor10 Auto Const
Actor Property playerref Auto Const

bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0) global debugOnly
	;we are sending callingObject so we can in the future route traces to different logs based on who is calling the function
	string logName = "QF_TestStimComment_0002B7A7"
	debug.OpenUserLog(logName) 
	RETURN debug.TraceUser(logName, CallingObject + ": " + asTextToPrint, aiSeverity)
	
EndFunction