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

	if(!owner.Adjacent(A))
		if(!silent)
			to_chat(owner, span_xenodanger("Our target must be adjacent!"))
		return FALSE
	if(!isliving(A) || isxeno(A)) //No grabbing your sisters instead of marines and no grabbing the dead.
		to_chat(owner,span_xenodanger("We can't grab that!"))
		return FALSE

/datum/action/xeno_action/activable/snatch/use_ability(atom/A)
	var/mob/living/carbon/xenomorph/brutalizer/X = owner
	X.start_pulling(A,snatch = TRUE)
	add_cooldown()
	succeed_activate()
// ***************************************
// *********** Super punch
// ***************************************
/datum/action/xeno_action/activable/punch/brutal
	plasma_cost = 20
	cooldown_timer = 15 SECONDS

/datum/action/xeno_action/activable/punch/brutal/use_ability(atom/A)
	var/mob/living/target = owner.pulling
	var/turf/target_turf = A
	if(iscarbon(target) && !isxeno(target)) //No smashing allies
		var/mob/living/carbon/xenomorph/X = owner
		if(target.pulledby == X) //If they're pulled by a brutalizer
			var/turf/slam_turf = get_step(get_turf(X),get_dir(get_turf(X),target_turf)) //Where the victim is landing
			X.visible_message(span_danger("\The [X] lifts [target] into the air!"), \
			span_xenowarning("We lift [target] into the air..."))
			if(!do_after(X, 2 SECONDS, TRUE, target, BUSY_ICON_DANGER))
				return fail_activate()
			X.stop_pulling()
			target.spin(1 SECONDS,5)
			X.visible_message(span_danger("\The [X] smashes [target] into the ground!"), \
			span_highdanger("And smash them into the ground!"))
			target.Paralyze(2 SECONDS, ignore_canstun = FALSE)
			//target.apply_damage(X.xeno_caste.melee_damage * X.xeno_melee_damage_modifier, BRUTE, "chest", target.run_armor_check("chest"))
			playsound(target, pick('sound/weapons/punch1.ogg','sound/weapons/punch2.ogg','sound/weapons/punch3.ogg','sound/weapons/punch4.ogg'), 50, 1)
			//X.do_attack_animation(target, ATTACK_EFFECT_YELLOWPUNCH)
			//X.do_attack_animation(target, ATTACK_EFFECT_DISARM2)
			X.face_atom(target_turf)
			target.forceMove(slam_turf)

			var/turf/lower_left
			var/turf/upper_right
			switch(get_dir(get_turf(X),slam_turf))
				if(NORTH)
					lower_left = locate(slam_turf.x - 1, slam_turf.y, slam_turf.z)
					upper_right = locate(slam_turf.x + 1, slam_turf.y + 2, slam_turf.z)
				if(SOUTH)
					lower_left = locate(slam_turf.x - 1, slam_turf.y - 2, slam_turf.z)
					upper_right = locate(slam_turf.x + 1, slam_turf.y, slam_turf.z)
				if(WEST)
					lower_left = locate(slam_turf.x - 2, slam_turf.y - 1, slam_turf.z)
					upper_right = locate(slam_turf.x, slam_turf.y + 1, slam_turf.z)
				if(EAST)
					lower_left = locate(slam_turf.x, slam_turf.y - 1, slam_turf.z)
					upper_right = locate(slam_turf.x + 2, slam_turf.y + 1, slam_turf.z)
				if(NORTHEAST)
					lower_left = slam_turf
					upper_right = locate(slam_turf.x + 2, slam_turf.y + 2, slam_turf.z)
				if(NORTHWEST)
					lower_left = locate(slam_turf.x - 2, slam_turf.y, slam_turf.z)
					upper_right = locate(slam_turf.x, slam_turf.y + 2, slam_turf.z)
				if(SOUTHEAST)
					lower_left = locate(slam_turf.x + 2, slam_turf.y - 2, slam_turf.z)
					upper_right = slam_turf
				if(SOUTHWEST)
					lower_left = locate(slam_turf.x - 2, slam_turf.y - 2, slam_turf.z)
					upper_right = slam_turf
			for(var/turf/affected_tile in block(lower_left, upper_right))
				affected_tile.Shake(6, 6, 2 SECONDS)
				for(var/mob/living/carbon/human/affected_human in affected_tile)
					if(affected_human == target) //The target was already hit no need for more
						continue
					affected_human.Paralyze(1 SECONDS, ignore_canstun = FALSE)
					to_chat(affected_human,span_danger("The shockwave knocks us off our feet !"))
					shake_camera(affected_human, 2, 1)

			succeed_activate()
			add_cooldown()
			return
	return ..()

/datum/action/xeno_action/activable/punch/brutal/can_use_ability(atom/A, silent, override_flags)
	if(ishuman(owner.pulling)) //Enables the alternate use of the super punch : smash whoever we're pulling
		return TRUE
	. = ..()

/atom/proc/super_punch_act(mob/living/carbon/xenomorph/X, damage, target_zone)
	return
