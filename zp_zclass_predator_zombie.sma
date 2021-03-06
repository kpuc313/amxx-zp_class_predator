/*****************************************************************
*                            MADE BY
*
*   K   K   RRRRR    U     U     CCCCC    3333333      1   3333333
*   K  K    R    R   U     U    C     C         3     11         3
*   K K     R    R   U     U    C               3    1 1         3
*   KK      RRRRR    U     U    C           33333   1  1     33333
*   K K     R        U     U    C               3      1         3
*   K  K    R        U     U    C     C         3      1         3
*   K   K   R         UUUUU U    CCCCC    3333333      1   3333333
*
******************************************************************
*                       AMX MOD X Script                         *
*     You can modify the code, but DO NOT modify the author!     *
******************************************************************
*
* Description:
* ============
* This is a plugin for Counte-Strike 1.6's Zombie Plague Mod which adds Predator class to zombie options.
*
*****************************************************************/

#include <amxmodx>
#include <fun>
#include <zombieplague>

new const zclass_name[] = { "Predator" } // name
new const zclass_info[] = { "Invicible" } // description
new const zclass_model[] = { "Predator" } // model
new const zclass_clawmodel[] = { "v_predator.mdl" } // claw model
const zclass_health = 2400 // health
const zclass_speed = 240 // speed
const Float:zclass_gravity = 1.0 // gravity
const Float:zclass_knockback = 1.5 // knockback

new g_zclass_predator_zombie

public plugin_init() 
{
	register_plugin("[ZP] Class: Predator", "1.0", "kpuc313")
}

public plugin_precache()
{
	g_zclass_predator_zombie = zp_register_zombie_class(zclass_name, zclass_info, zclass_model, zclass_clawmodel, zclass_health, zclass_speed, zclass_gravity, zclass_knockback)
}

public zp_user_infected_post(player, infector)
{
	if (zp_get_user_zombie_class(player) == g_zclass_predator_zombie)
	{
		if (zp_get_user_nemesis(player)) {
			set_user_rendering(player, kRenderFxGlowShell, 255, 0, 0, kRenderNormal, 25)
		} else {
			set_user_rendering(player, kRenderFxGlowShell, 55, 55, 55, kRenderTransAlpha)
		}
	}
	return PLUGIN_CONTINUE
}

public zp_user_unfrozen(id)
{
	if (zp_get_user_zombie_class(id) == g_zclass_predator_zombie)
	{
		if (zp_get_user_nemesis(id)) {
			set_user_rendering(id, kRenderFxGlowShell, 255, 0, 0, kRenderNormal, 25)
		} else {
			set_user_rendering(id, kRenderFxGlowShell, 55, 55, 55, kRenderTransAlpha)
		}
	}
	return PLUGIN_CONTINUE
}
