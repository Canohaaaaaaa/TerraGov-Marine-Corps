/mob/living/carbon/xenomorph/brutalizer
	caste_base_type = /mob/living/carbon/xenomorph/brutalizer
	name = "Brutalizer"
	desc = "WIP"
	icon = 'icons/Xeno/2x2_Xenos.dmi'
	health = 300
	maxHealth = 300
	plasma_stored = 200
	tier = XENO_TIER_THREE
	upgrade = XENO_UPGRADE_ZERO
	drag_delay = 6 //pulling a big dead xeno is hard
	mob_size = MOB_SIZE_BIG


/mob/living/carbon/xenomorph/brutalizer/start_pulling(atom/movable/AM, suppress_message = TRUE, snatch = FALSE)

	var/mob/living/L = AM
	if(snatch && ..())
		setGrabState(GRAB_NECK)
		ENABLE_BITFIELD(L.restrained_flags, RESTRAINED_NECKGRAB)
		RegisterSignal(L, COMSIG_LIVING_DO_RESIST, /atom/movable.proc/resisted_against)
		L.drop_all_held_items()
		L.Paralyze(1)
		visible_message(span_xenowarning("\The [src] grabs [L] by the waist!"), \
		span_xenowarning("We grab [L] by the waist!"))
		return TRUE

	. = ..(L, suppress_message)

//** We don't slash, we SMASH*/
/mob/living/carbon/xenomorph/brutalizer/attack_alien(mob/living/carbon/xenomorph/X, damage_amount = X.xeno_caste.melee_damage, damage_type = BRUTE, damage_flag = "", effects = TRUE, armor_penetration = 0, isrightclick = FALSE)
	switch(X.a_intent)
		if(INTENT_HELP)
			if(on_fire)
				playsound(loc, 'sound/weapons/thudswoosh.ogg', 25, TRUE, 7)
				ExtinguishMob()
				X.visible_message(span_danger("[X] effortlessly extinguishes the fire on [src]!"),
					span_notice("We extinguished the fire on [src]."), null, 5)
				return TRUE
			X.visible_message(span_notice("\The [X] pats [src] on the head with its club-like arm."), \
			span_notice("We pat [src] with our club-like arm."), null, 5)
			return FALSE

		if(INTENT_GRAB)
			return attack_alien_grab(X)

		if(INTENT_HARM, INTENT_DISARM)
			return attack_alien_harm(X)
	return FALSE
