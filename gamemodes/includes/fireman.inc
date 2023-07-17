#include <YSI\y_hooks>
#include "./includes/elec_pos_arr.inc"

enum _:E_FIRE {
	fire_Object, 
	Float:fire_Pos[3],
}

static Pool:fire;
new playerFire[MAX_PLAYERS], playerFireIndex[MAX_PLAYERS] = -1;

hook OnGameModeInit() {
	fire = pool_new();
	wait_ms(1);
}

hook OnPlayerConnect(playerid) {
	playerFireIndex[playerid] = -1;
	playerFire[playerid] = 0;
}

hook OnPlayerDisconnect(playerid, reason) {
	new index = playerFireIndex[playerid];
	if(index != -1) {
		new Fire[E_FIRE];
		if(pool_get_arr_safe(fire, index, Fire)) {
			if(IsValidPlayerObject(playerid, Fire[fire_Object])) {
				DestroyPlayerObject(playerid, Fire[fire_Object]);
			}
			pool_remove_deep(fire, index);
			playerFireIndex[playerid] = -1;
		}
	}
}

hook OnPlayerEnterCheckpoint(playerid) {
	if(playerFireIndex[playerid] != -1) {
		DisablePlayerCheckpoint(playerid);
		GivePlayerValidWeapon(playerid, WEAPON_FIREEXTINGUISHER, 666666);
		SendClientMessageEx(playerid, -1, "Dap lua di bro.");	
		playerFire[playerid] = 0;
	}
	return 1;
}

hook OnPlayerUpdate(playerid) {
    new
        keys, ud, lr;
            
    GetPlayerKeys(playerid, keys, ud, lr);
	if(((keys) & (KEY_FIRE)) == KEY_FIRE && GetPlayerWeapon(playerid) == WEAPON_FIREEXTINGUISHER) {
		if(playerFireIndex[playerid] != -1) {
			new Fire[E_FIRE];
			if(pool_get_arr_safe(fire, playerFireIndex[playerid], Fire)) {
				if(IsPlayerInRangeOfPoint(playerid, 5.0, Fire[fire_Pos][0], Fire[fire_Pos][1], Fire[fire_Pos][2])) {
					playerFire[playerid] += Random(1, 10);
					if(playerFire[playerid] >= 1000) {
						if(IsValidPlayerObject(playerid, Fire[fire_Object])) {
							DestroyPlayerObject(playerid, Fire[fire_Object]);
						}						
						SendClientMessage(playerid, -1, "Ban da hoan thanh cong viec");
						GivePlayerCash(playerid, Random(1000, 5000));
						pool_remove_deep(fire, playerFireIndex[playerid]);
						playerFireIndex[playerid] = -1;
						playerFire[playerid] = 0;
					
						PlayerInfo[playerid][pGuns][9] = 0;
						ResetPlayerWeaponsEx(playerid);
					}
				}	
			}
		}
	}
	return 1;
}

CMD:fireman(playerid) {
	new Fire[E_FIRE], arr_rand = random(sizeof(electrician_pos));
	if(playerFireIndex[playerid] == -1) {
		SetPlayerCheckpoint(playerid, electrician_pos[arr_rand][0], electrician_pos[arr_rand][1], electrician_pos[arr_rand][2], 3);
		Fire[fire_Object] = CreatePlayerObject(playerid, 18691, (Fire[fire_Pos][0] = electrician_pos[arr_rand][0] + random(3)), (Fire[fire_Pos][1] = electrician_pos[arr_rand][1]), (Fire[fire_Pos][2] = electrician_pos[arr_rand][2]) - 3.0, 0, 0, 0, 300.0);
		playerFireIndex[playerid] = pool_add_arr(fire, Fire);
		SendClientMessageEx(playerid, -1, "Den checkpoint di bro");
	}
	else SendClientMessageEx(playerid, -1, "Loi roi.");
	return 1;
}
