#include <amxmodx>
#include <amxmisc>
#include <amxconst>
#include <zombieplague>

#define PLUGIN_NAME "ZP: Vip Kill Earns"
#define PLUGIN_AUTHOR "bariscodefx"
#define PLUGIN_VERSION "1.0"

#define PERMISSION_LEVEL "r"
#define FRAG_COUNT 3

public plugin_init() {
	register_plugin(PLUGIN_NAME, PLUGIN_VERSION, PLUGIN_AUTHOR)
	register_event("DeathMsg", "onKill", "bf")
}

public onKill(Killer, Victim) {
	new attacker = read_data(1)
	new victim = read_data(2)

	if( !zp_get_user_zombie(attacker) )
	{
		if(!has_flag(attacker, PERMISSION_LEVEL)) return false;
		new ammopacks = zp_get_user_ammo_packs(attacker)
		zp_set_user_ammo_packs(attacker, ammopacks + FRAG_COUNT)
	}

	return false;
}
