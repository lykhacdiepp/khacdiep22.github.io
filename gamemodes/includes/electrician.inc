#include <YSI\y_hooks>
#include "./includes/elec_pos_arr.inc"

native MessageStr(playerid, color, AmxString:message) = SendClientMessage;

enum _:E_POWERPOLES {	
	Float:pp_pos[3],
	Text3D:pp_text,
	pp_energy,
	pp_object,
	pp_fixer,
}

new Pool:powerpoles; 

hook OnGameModeInit() {
	new i = 0;
	powerpoles = pool_new();

	do 
		power_pole_update_status(power_pole_create(electrician_pos[i][0], electrician_pos[i][1], electrician_pos[i][2]));
	while
		(++i < sizeof(electrician_pos));
	
	printf("[ELECTRICIAN] Load %d vi tri.", pool_size(powerpoles));
	wait_ms(1);
}

hook OnPlayerEnterCheckpoint(playerid) {
	if(GetPVarInt(playerid, "Find.PowerPoles")) {
		DisablePlayerCheckpoint(playerid);
	}
	return 1;
}

forward power_pole_create(const Float:X, const Float:Y, const Float:Z);
public power_pole_create(const Float:X, const Float:Y, const Float:Z) {
	new 
		pp[E_POWERPOLES], rand[] = {3854, 1308};

	pp[pp_object] = CreateDynamicObject(rand[random(sizeof(rand))], X, Y, Z - Random(2, 6), 0.0, 0.0, 0.0);
	pp[pp_text] = CreateDynamic3DTextLabel(#, -1, X, Y, Z, 10.0);
	pp[pp_pos][0] = X, pp[pp_pos][1] = Y, pp[pp_pos][2] = Z;
	pp[pp_fixer] = INVALID_PLAYER_ID;
	pp[pp_energy] = random(100);

	return pool_add_arr(powerpoles, pp);
}

power_pole_update_status(const index) {
	if(index < pool_size(powerpoles)) {
		new 
			pp[E_POWERPOLES], str[320], i, color_str[][11] = 
				{{"00ff00"}, {"ff9933"}, {"ff0000"}};

		if(pool_get_arr_safe(powerpoles, index, pp)) {
			if(IsValidDynamic3DTextLabel(pp[pp_text])) {
				i = pp[pp_energy] >= 70 ? (0) : pp[pp_energy] >= 30 ? 1 : 2;
				format(str, 320, "[{99cc00}TRU DIEN{ffffff}]\nTrang thai: {%s}%d%%", color_str[i], pp[pp_energy]);
				if(pp[pp_fixer] != INVALID_PLAYER_ID) format(str, 320, "%s\n{ffffff}Nguoi sua chua: {996600}%s", str, GetPlayerNameEx(pp[pp_fixer]));
				UpdateDynamic3DTextLabelText(pp[pp_text], -1, str);
			}
		}	
		return index;
	}
	return -1;
}

power_pole_nearest(const playerid) {
	new 
		pp[E_POWERPOLES];

	for_pool(i: powerpoles) {
		if(iter_get_arr_safe(i, pp)) {
			if(pp[pp_fixer] == INVALID_PLAYER_ID && IsPlayerInRangeOfPoint(playerid, 1.0, pp[pp_pos][0], pp[pp_pos][1], pp[pp_pos][2])) {
				return iter_get_key(i);
			}
		}
	}	
	return -1;
}

power_pole_get(const playerid) {
	new 
		pp[E_POWERPOLES];

	for_pool(i: powerpoles) {
		if(iter_get_arr_safe(i, pp)) {
			if(pp[pp_fixer] == playerid) {
				return iter_get_key(i);
			}
		}
	}	
	return -1;	
}
				   // 4 phut
const time_recover = (4 * 60) * 1000;
task power_poles_update[time_recover]() {
	new 
		pp[E_POWERPOLES];

	for_pool(i: powerpoles) {
		if(iter_get_arr_safe(i, pp)) {
			if(pp[pp_energy] >= 10 && pp[pp_fixer] == INVALID_PLAYER_ID) {
				pool_set_cell(powerpoles, iter_get_key(i), pp_energy, pp[pp_energy] - Random(5, 10));
				power_pole_update_status(iter_get_key(i));
			}
		}
	}
}

CMD:suadien(playerid) {
	if(IsPlayerInAnyVehicle(playerid)) return 1;
	if(power_pole_get(playerid) != -1) 
		return SendClientMessageEx(playerid, -1, "[{99cc00}THO DIEN{ffffff}]: Ban dang sua.");

	new i = power_pole_nearest(playerid); 
	if(i != -1) {
		new 
			pp[E_POWERPOLES];

		if(pool_get_arr_safe(powerpoles, i, pp)) {
			if(pp[pp_energy] >= 70) 
				return SendClientMessageEx(playerid, -1, "[{99cc00}THO DIEN{ffffff}]: Tru dien nay con kha tot.");
			
			new 
				price = 2000; // 2k

			pool_set_cell(powerpoles, i, pp_fixer, playerid);
			power_pole_update_status(i);

			SendClientMessageEx(playerid, -1, "[{99cc00}THO DIEN{ffffff}]: Ban dang sua chua tru dien, vui long khong ra khoi khu vuc");
			ApplyAnimation(playerid, "COP_AMBIENT", "Copbrowse_loop", 4.1, 1, 0, 0, 0, 0, 1);
			for(;;) {
				if(!IsPlayerConnected(playerid) || !IsPlayerInRangeOfPoint(playerid, 3.0, pp[pp_pos][0], pp[pp_pos][1], pp[pp_pos][2]) || IsPlayerInAnyVehicle(playerid)) {
					pool_set_cell(powerpoles, i, pp_fixer, INVALID_PLAYER_ID);
					power_pole_update_status(i);
					break;
				}

				task_yield(1);
				await task_ms(7000); // repeat time
				
				if(pool_get_arr_safe(powerpoles, i, pp)) {
					if(pp[pp_energy] >= 100) {
						pool_set_cell(powerpoles, i, pp_energy, 100);
						pool_set_cell(powerpoles, i, pp_fixer, INVALID_PLAYER_ID);
						MessageStr(playerid, -1, str_format("[{99cc00}THO DIEN{ffffff}]: Ban da nhan {009933}$%s{ffffff} tu cong viec.", number_format(price)));
						power_pole_update_status(i);
						break;
					}
					else {
						if(pp[pp_energy] <= 50) {
							if(random(6) == random(6)) {
								SetPlayerHealth(playerid, float(0));
								pool_set_cell(powerpoles, i, pp_fixer, INVALID_PLAYER_ID);
								SendClientMessageEx(playerid, -1, "[{99cc00}THO DIEN{ffffff}]: Ban da chet vi dien giat"); 
								power_pole_update_status(i);
								return 1;
							}
						}
						new rand = random(10);
						pool_set_cell(powerpoles, i, pp_energy, pp[pp_energy] + rand >= 100 ? 100 : rand + pp[pp_energy]);
						price += 200 * rand + Random(500, 1200);
					}
				}
				power_pole_update_status(i);
			}
			ClearAnimations(playerid);
		}
	}		
	else SendClientMessageEx(playerid, -1, "[{99cc00}THO DIEN{ffffff}]: Ban khong dung gan tru dien.");
	return 1;
}

CMD:dstd(playerid) return cmd_danhsachtrudien(playerid);
CMD:danhsachtrudien(playerid) {
	new 
		pp[E_POWERPOLES];

	for_pool(i: powerpoles) {
		if(iter_get_arr_safe(i, pp)) {
			if(pp[pp_energy] <= 70 && pp[pp_fixer] == INVALID_PLAYER_ID) {
				MessageStr(playerid, -1, str_format("[{99cc00}THO DIEN{ffffff}]: Tru dien so: %d | Khoang cach: %0.1fm | Trang thai: %d%%", iter_get_key(i), GetPlayerDistanceFromPoint(playerid, pp[pp_pos][0], pp[pp_pos][1], pp[pp_pos][2]), pp[pp_energy]));
			}
		}
	}
	SendClientMessageEx(playerid, -1, "TIPS: Su dung /timtrudien de den vi tri tru dien.");
	return 1;	
}

CMD:timtrudien(playerid, params[]) {
	if(isnull(params)) 
		return SendClientMessageEx(playerid, -1, "[{99cc00}THO DIEN{ffffff}]: /timtrudien [index]");
	
	new 
		index = strval(params), pp[E_POWERPOLES];

	if(index < pool_size(powerpoles)) {
		if(pool_get_arr_safe(powerpoles, index, pp)) {
			MessageStr(playerid, -1, str_format("Da danh dau tru dien so %d, khoang cach %0.1fm", index, GetPlayerDistanceFromPoint(playerid, pp[pp_pos][0], pp[pp_pos][1], pp[pp_pos][2])));
			SetPlayerCheckpoint(playerid, pp[pp_pos][0], pp[pp_pos][1], pp[pp_pos][2], float(2));
			SetPVarInt(playerid, "Find.PowerPoles", 1);
		}
	}
	else SendClientMessageEx(playerid, -1, "[{99cc00}THO DIEN{ffffff}]: Index khong hop le. Su dung /danhsachtrudien(/dstd) de xem index");
	return 1;
}
