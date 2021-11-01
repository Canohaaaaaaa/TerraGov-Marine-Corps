/datum/xeno_caste/brutalizer
	caste_name = "Brutalizer"
	display_name = "Brutalizer"
	upgrade_name = ""
	caste_desc = "WIP"

	caste_type_path = /mob/living/carbon/xenomorph/brutalizer
	tier = XENO_TIER_THREE
	upgrade = XENO_UPGRADE_BASETYPE

	// *** Melee Attacks *** //
	melee_damage = 19

	// *** Speed *** //
	speed = -0.7

	// *** Plasma *** //
	plasma_max = 200
	plasma_gain = 10

	// *** Health *** //
	max_health = 250

	// *** Evolution *** //
	upgrade_threshold = 250
	deevolves_to = /mob/living/carbon/xenomorph/warrior

	// *** Defense *** //
	soft_armor = list("melee" = 75, "bullet" = 65, "laser" = 65, "energy" = 65, "bomb" = XENO_BOMB_RESIST_3, "bio" = 90, "rad" = 90, "fire" = 65, "acid" = 90)

	// *** Abilities *** //
	actions = list(
		/datum/action/xeno_action/xeno_resting,
		/datum/action/xeno_action/activable/psydrain,
		/datum/action/xeno_action/activable/headbite,
		/datum/action/xeno_action/activable/devour,
		/datum/action/xeno_action/activable/snatch,
	)

/datum/xeno_caste/brutalizer/young
	upgrade_name = "Young"

	upgrade = XENO_UPGRADE_ZERO

/datum/xeno_caste/brutalizer/mature
	upgrade_name = "Mature"

	upgrade = XENO_UPGRADE_ONE

	// *** Speed *** //
	//Unchanged, up for balance

	// *** Plasma *** //
	//Unchanged, up for balance

	// *** Health *** //
	//Unchanged, up for balance

	// *** Evolution *** //
	upgrade_threshold = 750

	// *** Defense *** //
	//Unchanged, up for balance

	// *** Abilities *** //

/datum/xeno_caste/brutalizer/elder
	upgrade_name = "Elder"

	upgrade = XENO_UPGRADE_TWO

	// *** Melee Attacks *** //
	//Unchanged, up for balance

	// *** Speed *** //
	//Unchanged, up for balance

	// *** Plasma *** //
	//Unchanged, up for balance

	// *** Health *** //
	//Unchanged, up for balance

	// *** Evolution *** //
	upgrade_threshold = 1750

	// *** Defense *** //
	//Unchanged, up for balance

	// *** Abilities *** //
	//Unchanged, up for balance
/datum/xeno_caste/brutalizer/ancient
	upgrade_name = "Ancient"

	upgrade = XENO_UPGRADE_THREE

	// *** Melee Attacks *** //
	//Unchanged, up for balance

	// *** Speed *** //
	//Unchanged, up for balance

	// *** Plasma *** //
	//Unchanged, up for balance

	// *** Health *** //
	//Unchanged, up for balance

	// *** Defense *** //
	//Unchanged, up for balance

	// *** Abilities *** //
	//Unchanged, up for balance

/datum/xeno_caste/brutalizer/primordial
	upgrade_name = "Primordial"

	upgrade = XENO_UPGRADE_FOUR

	// *** Melee Attacks *** //
	//Unchanged, up for balance

	// *** Speed *** //
	//Unchanged, up for balance

	// *** Plasma *** //
	//Unchanged, up for balance

	// *** Health *** //
	//Unchanged, up for balance

	// *** Defense *** //
	//Unchanged, up for balance

	// *** Abilities *** //
	//Unchanged, up for balance
