/*
	made by liv javier
*/

#include <YSI\y_hooks>
#define DIALOG_BANDA 556
#define DIALOG_BANDA1 555

#define GIATIEN 5000 // 5k

enum _:E_MINERAL_INFO {
	_type,
	_object, 
	_attack_id,
	Text3D:_text,
	Float:_health,
}

new 
	Pool:minerals;

new mineral_modelid[][] = {
	{3929, 3930, 3931}, {3929, 3930, 3931}
};

new Float:arr_Pos[][] = {
	{-245.0081,      1366.2312,      63.8381,      91.6683},
	{-149.2836,      1302.4319,      15.7130,      236.7430},
	{74.6919,        1388.9929,      11.1925,      289.6968},
	{236.2272,       1574.4285,      26.9061,      322.5738},
	{270.9653,       1701.5338,      20.2269,      164.8206},
	{-63.4315,       1931.8613,      17.2266,      46.8612},
	{-484.2975,      2087.3115,      68.9037,      123.0019},
	{-820.6812,      1791.8649,      67.7914,      186.6092},
	{-670.4666,      1593.2505,      33.7478,      213.2428},
	{-657.6982,      1579.8958,      38.8471,      213.2428},
	{-629.4743,      1536.4631,      31.9992,      213.2428},
	{-449.2290,      1450.6638,      21.4266,      307.0028},
	{-434.6720,      1431.5929,      20.6794,      282.5626},
	{-395.9290,      1231.5333,      7.9269,       204.9510},
	{-394.6284,      1244.2568,      6.6315,       307.1288},
	{-407.5338,      1242.4247,      5.0659,       58.1646},
	{-406.9927,      1176.2302,      6.1484,       172.2190},
	{-360.0377,      1049.1978,      19.9768,      220.4728},
	{-439.2641,      915.6794,       5.0734,       154.9855},
	{-459.3125,      816.4581,       0.7046,       154.9855},
	{-20.0286,       848.0055,       33.6781,      279.0668},
	{14.2255,        1201.3251,      19.1616,      224.7147},
	{216.7628,       1311.6180,      14.9740,      13.6901},
	{204.6023,       983.4001,       28.3237,      205.1428},
	{221.6452,       947.0883,       28.3237,      205.1428},
	{261.9969,       791.7218,       11.1491,      205.1428},
	{318.9807,       740.5049,       6.8700,       225.1963},
	{198.4296,       650.0293,       7.5137,       44.7146},
	{-116.4239,      476.2587,       4.7995,       9.9342},
	{-328.9479,      517.2803,       0.2739,       85.4482},
	{-443.0532,      544.1692,       8.4526,       51.6079},
	{-711.5093,      672.3419,       2.8356,       51.6079},
	{-861.4758,      759.8688,       19.8025,      51.6079},
	{-919.2611,      849.5931,       15.8181,      22.7810}	
};

hook OnGameModeInit() {
	new 
		index = 0;
		
	minerals = pool_new();
	do {
		Mineral_Create(random(2), index, arr_Pos[index][0], arr_Pos[index][1], arr_Pos[index][2]);
	}
	while(++index < sizeof(arr_Pos));

	CreateActor(272,-214.9942,1192.8142,19.7422,8.2411); // banda
	CreateDynamic3DTextLabel("{cc6600}NPC\n{e68a00}Thu Mua Da\nNhap /banda", COLOR_YELLOW, -214.9942,1192.8142,19.7422+0.6,18.0);
	printf("[MINERAL]: Load %d mineral, %d location...", pool_size(minerals), sizeof(arr_Pos));
}

forward Mineral_Create(const type, i_pos, Float:X, Float:Y, Float:Z);
public Mineral_Create(const type, i_pos, Float:X, Float:Y, Float:Z) {
	static 
		_mineral[E_MINERAL_INFO], modelid, rand_make, Float:health;

	if(type >= 2) return print(":INVALID TYPE");

	rand_make = random(sizeof(mineral_modelid) + 1);
	modelid = mineral_modelid[type][rand_make];
	health = ((!type) ? (random(321) + 2000.5123) : random(1000) + 6000.1123) + float(66);

	_mineral[_type] = type;
	_mineral[_health] = health;
	_mineral[_attack_id] = 0xFFF;

	_mineral[_object] = CreateDynamicObject(modelid, X, Y, Z-0.7, 0.0, 0.0, 0.0);
	_mineral[_text] = CreateDynamic3DTextLabel(#, -1, X, Y, Z-0.4, type ? 15.0 : 10.0);		
	new index = pool_add_arr(minerals, _mineral);
	return Mineral_Update(index, health, 0xFFF);
}

Mineral_Respawn(const index, const sec = 240) {
	static _mineral[E_MINERAL_INFO];
	if(pool_get_arr_safe(minerals, index, _mineral)) {
		if(IsValidDynamicObject(_mineral[_object])) {
			DestroyDynamicObject(_mineral[_object]);
		}
		if(IsValidDynamic3DTextLabel(_mineral[_text])) {
			DestroyDynamic3DTextLabel(_mineral[_text]);
		}

		pool_set_cell(minerals, index, _health,    -1.0);	
		pool_set_cell(minerals, index, _attack_id, 0xFFF);	
		pool_set_cell(minerals, index, _text,   	_:_mineral[_text]);	
		pool_set_cell(minerals, index, _object, 	_mineral[_object]);
	
		await task_ms(sec * 1000);

		new 
			rand_make, type = random(2),
			modelid, Float:health = ((!type) ? (random(321) + 2000.5123) : random(1000) + 6000.1123) + float(66);
		
		rand_make = random(sizeof(mineral_modelid) + 1);
		modelid = mineral_modelid[type][rand_make];

		pool_set_cell(minerals, index, _object, CreateDynamicObject(modelid, arr_Pos[index][0], arr_Pos[index][1], arr_Pos[index][2]-0.7, 0.0, 0.0, 0.0));
		pool_set_cell(minerals, index, _text,   _:CreateDynamic3DTextLabel(#, -1, arr_Pos[index][0], arr_Pos[index][1], arr_Pos[index][2]-0.4, type ? 15.0 : 10.0));
		Mineral_Update(index, health);
	}
}

Mineral_Update(const index, const Float:health, const attack_id = 0xFFF) {
	if(index < pool_size(minerals)) {
		static _mineral[E_MINERAL_INFO];
		if(pool_get_arr_safe(minerals, index, _mineral)) {
			if(IsValidDynamic3DTextLabel(_mineral[_text])) {
				new _string[128], attack_name[24 + 2];
				if(attack_id == 0xFFF) 
					strcat(attack_name, "{cc6600}(/kt)");
				else 
					format(attack_name, 26, "{e68a00}[%s]", GetPlayerNameEx(attack_id));

				format(_string, sizeof(_string), "[{3399ff}KHOANG SAN{ffffff}]\nLoai: {3399ff}%s{ffffff}\nHP: {ff0000}%0.2f\n%s", _mineral[_type] ? ("To") : ("Nho"), health, attack_name);
				UpdateDynamic3DTextLabelText(_mineral[_text], -1, _string);
			}
			pool_set_cell(minerals, index, _health,    health);
			pool_set_cell(minerals, index, _attack_id, attack_id);			
		}
		return index;
	}
	return 0;
}

mineral_get_type(const index) {
	if(index < pool_size(minerals)) {
		static _mineral[E_MINERAL_INFO];
		if(pool_get_arr_safe(minerals, index, _mineral)) {
			return _mineral[_type];
		}
	}
	return -1;	
}

mineral_get_attacked(const index) {
	if(index < pool_size(minerals)) {
		static _mineral[E_MINERAL_INFO];
		if(pool_get_arr_safe(minerals, index, _mineral)) {
			return _mineral[_attack_id];
		}
	}
	return 0xFFF;	
}

Float:mineral_get_health(const index) {
	if(index < pool_size(minerals)) {
		static _mineral[E_MINERAL_INFO];
		if(pool_get_arr_safe(minerals, index, _mineral)) {
			return _mineral[_health];
		}
	}
	return 0.132;
}

player_get_mineral_Id(const playerid) {
	static 
		_mineral[E_MINERAL_INFO];
	
	for_pool(i: minerals) {
		if(iter_get_arr_safe(i, _mineral, sizeof(_mineral))) {
			if(_mineral[_attack_id] == playerid) {
				return iter_get_key(i);
			}
		}
	}
	return -1;
}

player_get_nearest_mineral(const playerid, const Float:distance_ = 15.0) {

	new index, Float:max_distance = distance_, Float:cur_dist;

	index = -1;
    for(new i = 0, _mineral[E_MINERAL_INFO]; i < sizeof(arr_Pos); i ++) {
        if(i < pool_size(minerals)) {
	        pool_get_arr_safe(minerals, i, _mineral);
	        if(_mineral[_health] > 0) {
		        if((cur_dist = GetPlayerDistanceFromPoint(playerid, arr_Pos[i][0], arr_Pos[i][1], arr_Pos[i][2])) < max_distance) {
		            max_distance = cur_dist;
		            index = i;
		        }
		    }
		}
    }
    return index;
}

CMD:kt(playerid) {
	if(player_get_mineral_Id(playerid) != -1) 
		SendClientMessageEx(playerid, -1, "[{66ff33}KHAI THAC{ffffff}]: Ban dang khai thac, su dung (/dungkhaithac) de nhat may khai thac len.");
	
	else {
		new i = player_get_nearest_mineral(playerid, 15.0);
		if(i != -1) {
			if(IsPlayerInRangeOfPoint(playerid, (!mineral_get_type(i) ? 3.0 : 8.5), arr_Pos[i][0], arr_Pos[i][1], arr_Pos[i][2])) {
				if(mineral_get_attacked(i) == 0xFFF) {
					PlayerPlaySound(playerid, 1136, 0, 0, 0);
					Mineral_Update(i, mineral_get_health(i), playerid);
					SetTimerEx("OnMineralExploit", 3000, 0, "dd", playerid, i);
					SendClientMessageEx(playerid, -1, "[{66ff33}KHAI THAC{ffffff}]: Da bat dau khai thac.");
				}	
				else SendClientMessageEx(playerid, -1, "[{66ff33}KHAI THAC{ffffff}]: Da co nguoi khai thac.");
			}
		}
		else SendClientMessageEx(playerid, -1, "[{66ff33}KHAI THAC{ffffff}]: Ban khong dung gan khoang san.");
	}
	return 1;
}

CMD:dungkhaithac(playerid) {
	new i = player_get_mineral_Id(playerid);
	if(i != -1) {
		Mineral_Update(i, mineral_get_health(i), 0xFFF);
		SendClientMessageEx(playerid, -1, "[{66ff33}KHAI THAC{ffffff}]: Ban da dung khai thac.");
	}
	return 1;	
}
CMD:khoangsan(playerid) {
	new string[128];
	format(string, 128, "So Luong Da Cua Ban: %d", PlayerInfo[playerid][pDa]);
	SendClientMessage(playerid, -1, string);
	return 1;
}
CMD:banda(playerid){
	if(IsPlayerInRangeOfPoint(playerid, 2,0 -214.9942,1192.8142,19.7422)) {
	ShowPlayerDialog(playerid, DIALOG_BANDA, DIALOG_STYLE_LIST, "Xin Chao Ban Muon Ban Hay Trao Doi", "Ban\nTrao Doi", "O", "X");
	}
	else SendClientMessage(playerid, -1, "Ban khong o gan NPC");
	return 1;
}
hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
	if(dialogid == DIALOG_BANDA) {
	  	if(response) {
			if(listitem == 0)
			{
				new string[128];
				format(string, 128, "\nSo Luong Da ban dang co: %d\nGia tien $%d/Da\nNhap so luong ban muon ban:", PlayerInfo[playerid][pDa], GIATIEN);
				ShowPlayerDialog(playerid, DIALOG_BANDA1, DIALOG_STYLE_INPUT, "Ban Da", string,"O","X");
			}
			if(listitem == 1)
			{
				SendClientMessage(playerid, -1, "Dang Update");
			}
		}
	}
	if(dialogid == DIALOG_BANDA1) {
		if(response) {
			if(strval(inputtext) > 0) {
				if(PlayerInfo[playerid][pDa] >= strval(inputtext)) {
					new string[128];
					PlayerInfo[playerid][pDa] -= strval(inputtext);
					GivePlayerCash(playerid, strval(inputtext)*GIATIEN);
					format(string, 128, "[{66ff33}KHAI THAC{ffffff}]: Ban da ban %d mot so luong da va nhan duoc $%d", strval(inputtext), strval(inputtext)*GIATIEN);
					SendClientMessage(playerid, -1, string);
				}
				else
					SendClientMessage(playerid, -1,"[{66ff33}KHAI THAC{ffffff}] So luong khong hop le! hay kiem tra lai so luong cua ban");
			}
			else
				SendClientMessage(playerid, -1,"[{66ff33}KHAI THAC{ffffff}] So luong can ban phai lon hon 0!");
		}
	}
	return 1;
}

forward OnMineralExploit(const playerid, const i);
public OnMineralExploit(const playerid, const i) {
	if(IsPlayerConnected(playerid)) {
		new 
			_mineral[E_MINERAL_INFO], Float:rand_attack = mineral_get_health(i) - (100.01319 + random(300));
		
		pool_get_arr_safe(minerals, i, _mineral);
		if(IsPlayerInRangeOfPoint(playerid, 15.0, arr_Pos[i][0], arr_Pos[i][1], arr_Pos[i][2])) {
			
			printf("%f | f%f", _mineral[_health], mineral_get_health(i));

			if(rand_attack <= 50.0) {
				// Mineral_Update(i, rand_attack - 1, 0xFFF);
				PlayerInfo[playerid][pDa] += 2; // + 3 da
				SendClientMessageEx(playerid, -1, "[{66ff33}KHAI THAC{ffffff}]: Da khai thac xong.");
				SendClientMessageEx(playerid, -1, "[{66ff33}KHAI THAC{ffffff}]: Ban da nhan duoc 2 da (/khoangsan)");
				Mineral_Respawn(i, 300); // 300 = 5p
			}
			else {
				Mineral_Update(i, rand_attack, playerid);
				SetTimerEx("OnMineralExploit", 3000, 0, "dd", playerid, i);
			}
		}
		else {
			SendClientMessageEx(playerid, -1, "[{66ff33}KHAI THAC{ffffff}]: Ban da di qua xa khoang san.");
			Mineral_Update(i, mineral_get_health(i), 0xFFF);
		}
	}
	else Mineral_Update(i, mineral_get_health(i), 0xFFF);
}

hook OnPlayerDisconnect(playerid, reason) {
	new i = player_get_mineral_Id(playerid);
	if(i != -1) {
		Mineral_Update(i, mineral_get_health(i), 0xFFF);
	}
}
