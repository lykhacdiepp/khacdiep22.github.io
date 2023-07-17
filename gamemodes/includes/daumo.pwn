
#include <ysi\y_hooks>

#define SZ: sizeof 
#define FRtime:!%1(%2) forward %1(%2); public %1(%2)
enum oil_info {
	o_health,
	o_respawn, 
	Text3D:o_name,
	// 
	o_occupyid, // Nguoi chiem
}

new const Float: Pst_Oil[][] = {
{-473.6861,908.3481,-0.5819,162.6815}, // khaithac
{-475.0937,894.7534,-0.3128,176.0504}, // khaithac
{-476.1559,879.3674,-0.3463,176.0504}, // khaithac
{-477.4353,860.8344,-0.2739,176.0504}, // khaithac
{-499.6327,857.5405,-0.1764,89.9874}, // khaithac
{-500.6198,869.1844,-0.2409,354.9421}, // khaithac
{-499.1261,886.0612,-0.2029,354.9421} // khaithac
};

new OilInfo[SZ: Pst_Oil][oil_info];

hook OnGameModeInit() { 
	//printf("Te: %d", SZ(Pst_Oil));
	for(new i = 0 ; i < SZ: Pst_Oil; i ++) {
		// Create
		OilInfo[i][o_name] = CreateDynamic3DTextLabel("...", -1, Pst_Oil[i][0],Pst_Oil[i][1],Pst_Oil[i][2]+2, 12);
		CreateDynamicObject(3474, Pst_Oil[i][0],Pst_Oil[i][1],Pst_Oil[i][2]-3.5,0,0,0);
		//
		OilInfo[i][o_health] = 100;
		OilInfo[i][o_occupyid] = INVALID_PLAYER_ID;
		UpdateOilInfo(i);
	}
	CreateActor(72, -132.2885,1179.2246,19.7422,93.8792);
	CreateDynamic3DTextLabel("[{FF3333}GvR]\n{FFFFFF}Nguoi thu mua dau tho\n Y De Ban", -1, -132.2885,1179.2246,19.7422+0.5, 8);
	return 1;
}

hook OnPlayerConnect(playerid) {
	SetPVarInt(playerid, "OccupyID", -1);
	return 1;
}

hook OnPlayerDisconnect(playerid, reason) {
	if(GetPVarInt(playerid, "OccupyID") != -1) {
		new i = GetPVarInt(playerid, "OccupyID");
		KillTimer(GetPVarInt(playerid, "PlayerOccupy"));
		SetPVarInt(playerid, "OccupyID", -1);
		OilInfo[i][o_respawn] = gettime() + 10;
		OilInfo[i][o_occupyid] = INVALID_PLAYER_ID;		
		UpdateOilInfo(i);
	}
	return 1;
}

hook OnPlayerDeath(playerid) {
	if(GetPVarInt(playerid, "OccupyID") != -1) {
		new i = GetPVarInt(playerid, "OccupyID");
		OilInfo[i][o_respawn] = gettime() + 10;
		OilInfo[i][o_occupyid] = INVALID_PLAYER_ID;		
		KillTimer(GetPVarInt(playerid, "PlayerOccupy"));
		SetPVarInt(playerid, "OccupyID", -1);
		UpdateOilInfo(i);
	}	
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys) {
	if(newkeys == KEY_YES) {
		if(IsPlayerInRangeOfPoint(playerid, 2,-132.2885,1179.2246,19.7422)) {
			ShowPlayerDialog(playerid, 1114, DIALOG_STYLE_INPUT, "Sell", "Dau ($7500)\nNhap so luong ban muon ban.", "Ban", "Huy");
		}
	}
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
	if(dialogid == 1114) {
		if(response) {
			if(strval(inputtext)) {
				listitem = GetPVarInt(playerid, "Listitem_");
				new amount = strval(inputtext);
				if(amount > 0 && PlayerInfo[playerid][pDau] >= amount) {
					new string[128];
					PlayerInfo[playerid][pCash]+= amount*7500;
					GiveDau(playerid, -amount);

					format(string, 128, "Ban da ban %d dau voi gia $%d",amount , amount*7500); // 7k5 1 dầu
					SendClientMessage(playerid, -1, string);
				}
				else SendClientMessage(playerid, -1, "So luong khong hop le..");
			}
		}
	}
	return 1;
}

UpdateOilInfo(i) {
	new string[128];
	format(string, 128, "Khu dau tho (GvR)\nTrang thai: %d%%\nSo huu: %s", OilInfo[i][o_health], GetoNameEx(OilInfo[i][o_occupyid]));
	UpdateDynamic3DTextLabelText(OilInfo[i][o_name], -1, string);
}

SetOilRespawn(i, s) {
	OilInfo[i][o_health] = 100;
	OilInfo[i][o_respawn] = gettime() + s;
	OilInfo[i][o_occupyid] = INVALID_PLAYER_ID;
}

stock GetoNameEx(i) {
	new name[32];
	if(i == INVALID_PLAYER_ID) name = "None";
	else GetPlayerName(i, name, 32);
	return name;
}

stock CheckRangeOil(playerid) {
	for(new i = 0; i < SZ: Pst_Oil; i ++) {
		if(IsPlayerInRangeOfPoint(playerid, 6, Pst_Oil[i][0],Pst_Oil[i][1],Pst_Oil[i][2])) {
			return i;
		}
	}
	return -1;
}

FRtime:!StartOccupy(playerid, i) {
	new ran = 1+random(15);
	if(IsPlayerInRangeOfPoint(playerid, 10, Pst_Oil[i][0],Pst_Oil[i][1],Pst_Oil[i][2])) {
		if(OilInfo[i][o_health] - ran > 0) {
			OilInfo[i][o_health] -= ran; 
		}
		else { // <
			SetOilRespawn(i, 90); // 90 giay khai thac 
			KillTimer(GetPVarInt(playerid, "PlayerOccupy"));
			printf("PVariable :%d", GetPVarInt(playerid, "PlayerOccupy"));

			new str[128], rand = 1 + random(1); // 1 dầu
			GiveDau(playerid, rand);
			format(str, 128, "Ban nhan duoc %d dau", rand);
			SendClientMessage(playerid, -1, str);
			SetPVarInt(playerid, "OccupyID", -1); 
		}
	}
	else {
		OilInfo[i][o_respawn] = gettime() + 60; // 60 giay moi co the khai thac tiep
		OilInfo[i][o_occupyid] = INVALID_PLAYER_ID;
		KillTimer(GetPVarInt(playerid, "PlayerOccupy"));
		SetPVarInt(playerid, "OccupyID", -1); 
		SendClientMessage(playerid, -1, "Ban da di qua xa khu vuc khai thac");
	}
	UpdateOilInfo(i);
	return 1;
}

CMD:khaithac(playerid) {
	if(GetPVarInt(playerid, "OccupyID") != -1) return 1;
	new i = CheckRangeOil(playerid);
	if(PlayerInfo[playerid][pDau] < 20) {
	}
	else SendClientMessage(playerid, -1, "Ban da khai thac du so luong vui long di ban");
	if(i == -1) {
		SendClientMessage(playerid, -1, "Ban khong the khai thac o day.");
	}
	else {
		new str[128];
		if(OilInfo[i][o_occupyid] != INVALID_PLAYER_ID) {
			format(str, 128, "Dang duoc khai thac boi %s", GetoNameEx(OilInfo[i][o_occupyid]));
			SendClientMessage(playerid, -1, str);
		}
		else {
			if(OilInfo[i][o_respawn] > gettime()) {
				format(str, 128, "Con %ds nua de co the khai thac o day ...", OilInfo[i][o_respawn] - gettime());
				SendClientMessage(playerid, -1, str);
			}
			else {
				OilInfo[i][o_occupyid] = playerid;
				SetPVarInt(playerid, "OccupyID", i);
				SendClientMessage(playerid, -1, "Ban dang chiem khu nay. Vui long khong roi khoi day 10.0m");
				SetPVarInt(playerid, "PlayerOccupy", SetTimerEx("StartOccupy", 5000, true, "dd", playerid, i));
				//printf("PVariable :%d", GetPVarInt(playerid, "PlayerOccupy"));
				UpdateOilInfo(i);
			}
		}
	}
	return 1;
}  
forward GiveDau(playerid,value);
public GiveDau(playerid,value){
	new query[128];
	PlayerInfo[playerid][pDau] += value;
	format(query, sizeof(query), "UPDATE accounts SET `Dau` =%d WHERE `id` = %d", PlayerInfo[playerid][pDau], GetPlayerSQLId(playerid));
	mysql_function_query(MainPipeline, query, false, "OnQueryFinish", "ii", SENDDATA_THREAD, playerid);
	return 1;
}
