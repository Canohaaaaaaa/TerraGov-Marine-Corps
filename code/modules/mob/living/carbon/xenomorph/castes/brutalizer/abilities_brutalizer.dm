// ***************************************
// *********** Snatch
// ***************************************
/datum/action/xeno_action/activable/snatch
	name = "Snatch"
	desc = "WIP"
	action_icon_state = "lunge"
	plasma_cost = 50 //TODO : Balance
	mechanics_text = "WIP (FORCE GRAB)"
	cooldown_timer = 20 SECONDS
	ability_name = "snatch"
	var/atom/target_mob //Who's going to brazil ?

/datum/action/xeno_action/activable/snatch/on_cooldown_finish()
	to_chat(owner, span_xenonotice("We are ready to abduct once more."))
	owner.playsound_local(owner, 'sound/effects/xeno_newlarva.ogg', 25, 0, 1)
	return ..()

/datum/action/xeno_action/activable/snatch/can_use_ability(atom/A, silent = FALSE, override_flags)
	. = ..()
	if(!.)
		return

	if(!owner.Adjacent(A) || !silent)
		to_chat(owner, span_xenodanger("Our target must be adjacent!"))
		return FALSE
	if(!isliving(A) || isxeno(A)) //No grabbing your sisters instead of marines and no grabbing the dead.
		to_chat(owner,span_xenodanger("We can't grab that!"))
		return FALSE

/datum/action/xeno_action/activable/lunge/use_ability(atom/A)
	var/mob/living/carbon/xenomorph/brutalizer/X = owner
	X.start_pulling(A,TRUE)
	add_cooldown()
	succeed_activate()


