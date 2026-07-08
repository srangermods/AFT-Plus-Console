Scriptname CIS_EnterNewLocationTrigger extends ObjectReference Const

keyword Property CIS_ENL_Keyword const auto
{Keyword for the topic to say
filter for "CIS_ENL"
}

Event OnTriggerEnter(ObjectReference akActionRef) 

	Actor actorRef = akActionRef as Actor

	if actorRef && actorRef.IsInFaction(Game.GetCommonProperties().CurrentCompanionFaction)

		GlobalVariable TweakCommentSynch = Game.GetFormFromFile(0x010424D5,"AmazingFollowerTweaks.esp") as GlobalVariable

		Quest followers_script = FollowersScript.GetScript()
		Actor companion1 = (followers_script.GetAlias(17) as ReferenceAlias).getActorRef()
		Actor companion2 = (followers_script.GetAlias(18) as ReferenceAlias).getActorRef()
		Actor companion3 = (followers_script.GetAlias(19) as ReferenceAlias).getActorRef()
		Actor companion4 = (followers_script.GetAlias(20) as ReferenceAlias).getActorRef()
		Actor companion5 = (followers_script.GetAlias(21) as ReferenceAlias).getActorRef()
		Actor companion6 = (followers_script.GetAlias(24) as ReferenceAlias).getActorRef()
		Actor companion7 = (followers_script.GetAlias(25) as ReferenceAlias).getActorRef()
		Actor companion8 = (followers_script.GetAlias(26) as ReferenceAlias).getActorRef()
		Actor companion9 = (followers_script.GetAlias(27) as ReferenceAlias).getActorRef()
		Actor companion10 = (followers_script.GetAlias(28) as ReferenceAlias).getActorRef()
		int maxwait = 100 ; 20 seconds
		; Early Bails...
		if (!TweakCommentSynch)
			actorRef.SayCustom(CIS_ENL_Keyword)
			return
		endif
		if (1.0 != TweakCommentSynch.GetValue())
			actorRef.SayCustom(CIS_ENL_Keyword)
			return
		endif
		Actor playerref = Game.getPlayer()
		; DogMeat Special Case
		if !actorRef.HasKeyword(Game.GetForm(0x00013794) as Keyword) ; ActorTypeNPC
		
			; Non-humanoid. Dont block... (Dogmeat is the only non-humanoid companion)
			; that might receive CIS events...
			while (playerref.isInScene() || (companion1.isTalking() || companion2.isTalking() || companion3.isTalking() || companion4.isTalking() || companion5.isTalking() || companion6.isTalking() || companion7.isTalking() || companion8.isTalking() || companion9.isTalking() || companion10.isTalking()) && maxwait > 0)
				Utility.wait(Utility.RandomFloat(0.1,0.5))
				maxwait -= 1
			endwhile
			actorRef.SayCustom(CIS_ENL_Keyword)
			trace(self, actorRef + " - CIS_EnterNewLocationTrigger said line for: "+CIS_ENL_Keyword)
			return
		endif
		


		; TweakCommentSynch Support :
		
		; The following 4 factions are added to the Companion referenceAlias on the Followers Quest:
		;
		;    AO_Type_Comment_1024
		;    AO_Type_Comment_512
		;    AO_Type_Comment_256
		;    AO_Type_Comment_128
		;
		;  RotateCompanion() in Followers:TweakDFScript rotates the Companion reference (pointer) 
		;  through the 5 humanoid companion slots. Along the way it adds/removes these keywords
		;  when TweakCommentSynch is true. This prevents everyone from speaking up at once for
		;  Attraction Object Comment events. We can use the same Faction based solution here.
		;  We dont need to check all four keywords. Just need to check for one.
		;
		;  I BELIEVE this faction lookup and check is cheaper than resolving the QUEST, casting to 
		;  a script and then grabbing the Companion ReferenceAlias propery, getting its contents 
		;  and comparing it to the actorRef.
		
		if actorRef.HasKeyword(Game.GetForm(0x00181063) as Keyword) ; AO_Type_Comment_1024

			maxwait = 100

			while ( (playerref).isInScene() || (companion1.isTalking() || companion2.isTalking() || companion3.isTalking() || companion4.isTalking() || companion5.isTalking() || companion6.isTalking() || companion7.isTalking() || companion8.isTalking() || companion9.isTalking() || companion10.isTalking())  && maxwait > 0)
				Utility.wait(Utility.RandomFloat(0.1,1.0))
				maxwait -= 1
			endwhile
			trace(self, actorRef + " - CIS_EnterNewLocationTrigger said line for: "+CIS_ENL_Keyword)
			actorRef.SayCustom(CIS_ENL_Keyword)
			
		; elseif actorRef.HasKeyword(Game.GetForm(0x0002B7A4) as Keyword) ; AO_Type_Comment_512
		; 	actorRef.SayCustom(CIS_ENL_Keyword)
		; elseif actorRef.HasKeyword(Game.GetForm(0x0017553F) as Keyword) ; AO_Type_Comment_256
		; 	actorRef.SayCustom(CIS_ENL_Keyword)
		; elseif actorRef.HasKeyword(Game.GetForm(0x0017553F) as Keyword) ; AO_Type_Comment_128
		;	 actorRef.SayCustom(CIS_ENL_Keyword)
		
		endif
				
	endif


EndEvent

bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0) global debugOnly
	;we are sending callingObject so we can in the future route traces to different logs based on who is calling the function
	string logName = "CIS_EnterNewLocationTrigger"
	debug.OpenUserLog(logName) 
	RETURN debug.TraceUser(logName, CallingObject + ": " + asTextToPrint, aiSeverity)
	
EndFunction