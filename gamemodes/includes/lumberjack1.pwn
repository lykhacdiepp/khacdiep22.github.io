/* 
	Lumber Jack 
	Script by LilJavier
*/

// check chat go cu bao 3/3 out ra vao lai van bi 3/3 khong the chat itpe
#include <ysi\y_hooks>

/* ========= Defines ========= */
#define MAX_TREES 12  
#define INVALID_TREE -1 // Khong dung vao day

#define MAX_SLOT_TREE 3 // Khong dung vao day
#define DIADIEM_TRAGO -2043.8013, 976.4552, 54.6719 // Dia diem tra go
#define KV_LAYXE_LJ -1930.6116,1089.9666,51.2822 // Khu vuc lay xe

#define LOOP:(%1,%2) for(%1 = 0 ; %1 < %2; %1 ++) // Khong dung vao day
#define GetFrogKidPos(%1) new Float:FrPos[3]; GetPlayerPos(%1, FrPos[0], FrPos[1], FrPos[2]) // Ko dung vo cai nay
/* ========= Enum & Variable ========= */
enum e_lj_data {
	lj_Tree, // Object ID
	Text3D:lj_Name, // Label cay
	lj_Attacked_Player, // Nguoi so huu

	Float:lj_Cro[3], // Vi Tri
}
enum char_lj_data {
	PlayerTime_LumberJack,
	Player_Attack_Tree,
	Player_Tree_Count,
	// Object & Vehicle
	//Player_Object_Slot[MAX_SLOT_TREE], // Object Attachment
	Player_Object_DYN[MAX_SLOT_TREE], // Object duoi dat
	Player_Vehicle_ID,
}

new DeoBietTen[MAX_PLAYERS] = 0;

new char_lumberjack[MAX_PLAYERS][char_lj_data];
new LumberJack[MAX_TREES][e_lj_data];
new const Float:Tree_Default[MAX_TREES][] = {
{-1927.7886, 1098.9680, 50.3386}, // 1
{-1928.6238, 1107.0432, 50.0369}, // 2
{-1929.2727, 1117.8257, 49.1659}, // 3
{-1937.4136, 1118.8644, 50.3626}, // 4
{-1939.6018, 1110.2419, 51.5778}, // 5
{-1941.9386, 1100.9808, 52.8427}, // 6
{-1948.6104, 1099.6820, 54.2439}, // 7
{-1949.5670, 1110.1750, 53.5457}, // 8
{-1949.4921, 1123.2858, 51.7950}, // 9
{-1945.0634, 1136.8258, 48.8662}, // 10
{-186.7107,880.2290,9.8737,22.0699}, // 11
{-185.5553,893.1254,10.7468,22.0699} // 12
};
/* ========= Callbacks ========= */
hook OnGameModeInit() {
	new i = 0;
	LOOP:(i,MAX_TREES) {
		CreateTree(i);
	}
	CreateDynamic3DTextLabel("Khu vuc lay xe cong viec\n/layxecongviec\n", -1, KV_LAYXE_LJ, 15);
	return 1;
}

hook OnPlayerConnect(playerid) {

	DeoBietTen[playerid] = 0;
	char_lumberjack[playerid][Player_Tree_Count] = 0;
	char_lumberjack[playerid][Player_Attack_Tree] = INVALID_TREE;
	char_lumberjack[playerid][Player_Vehicle_ID] = INVALID_VEHICLE_ID;
	for(new i = 0 ; i < 3 ; i ++) {
		//if(IsValidObject(char_lumberjack[playerid][Player_Object_DYN][i])) DestroyObject(char_lumberjack[playerid][Player_Object_DYN][i]);
		char_lumberjack[playerid][Player_Object_DYN][i] = INVALID_OBJECT_ID;
	}	
	return 1;
}
hook OnPlayerDisconnect(playerid, reason) {
	if(char_lumberjack[playerid][Player_Vehicle_ID] != INVALID_VEHICLE_ID) {
		DestroyVehicle(char_lumberjack[playerid][Player_Vehicle_ID]);
	}
	if(char_lumberjack[playerid][Player_Attack_Tree] != INVALID_TREE) {
		SetTreeAttacked(char_lumberjack[playerid][Player_Attack_Tree], INVALID_PLAYER_ID); 
		LumberJack[char_lumberjack[playerid][Player_Attack_Tree]][lj_Attacked_Player] = INVALID_PLAYER_ID;
		KillTimer(char_lumberjack[playerid][PlayerTime_LumberJack]);
	}
	if(char_lumberjack[playerid][Player_Tree_Count] > 0) {
		for(new i = 0; i < char_lumberjack[playerid][Player_Tree_Count]; i ++) {
			if(IsValidObject(char_lumberjack[playerid][Player_Object_DYN][i])) {
				DestroyObject(char_lumberjack[playerid][Player_Object_DYN][i]);
			}
		}
	}
	return 1;
}
hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys) {
	
/*	if(newkeys & KEY_YES) { 
		if(DeoBietTen[playerid] > 0) {
			if(char_lumberjack[playerid][Player_Tree_Count] < MAX_SLOT_TREE) {
				if(GetPVarInt(playerid, "WOODPILE") == 0) {
					new Float:X,Float:Y,Float:Z;
					for(new i = 0; i < 3; i ++) {
						GetObjectPos(char_lumberjack[playerid][Player_Object_DYN][i], X,Y,Z);
						if(IsPlayerInRangeOfPoint(playerid,2, X,Y,Z) && char_lumberjack[playerid][Player_Object_DYN][i] != INVALID_OBJECT_ID) {
							SetPVarInt(playerid, "WOODPILE", 1);
							DeoBietTen[playerid] --;
							SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);	
							ApplyAnimation(playerid, "CARRY", "liftup", 4.1, 0, 0, 0, 0, 0, 1);	
							SendClientMessage(playerid, -1, "[{ccccff}GvR LumberJack{ffffff}]: Den gan xe da thue su dung them Y lan nua");
							DestroyObject(char_lumberjack[playerid][Player_Object_DYN][i]);
							SetPlayerAttachedObject(playerid, 9, 1463, 1, 0.1539, 0.5870, 0.0000, 0.0000, 84.7999, 0.0000, 0.8460, 0.4109, 0.4190, 0xFFFFFFFF, 0xFFFFFFFF);
							break;					
						}
					}
				}
			}
		}
	}*/
/*	if(newkeys & KEY_YES) {
		if(GetPVarInt(playerid, "WOODPILE") == 1) {
			new Float:X,Float:Y,Float:Z;
			GetVehiclePos(char_lumberjack[playerid][Player_Vehicle_ID], X,Y,Z);
			if(IsPlayerInRangeOfPoint(playerid, 2.2, X,Y,Z)) {
				new string[128];
				SetPVarInt(playerid, "WOODPILE", 0);
				new i = char_lumberjack[playerid][Player_Tree_Count];
				SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);	
				char_lumberjack[playerid][Player_Object_DYN][i] = CreateObject(1463, X,Y,Z,0,0,0);
				format(string, 128, "[{ccccff}GvR LumberJack{ffffff}]: %d/%d Cay", i+1,MAX_SLOT_TREE);
				SendClientMessage(playerid, -1, string);
				RemovePlayerAttachedObject(playerid, 9);
				switch(i) {
					case 0: AttachObjectToVehicle(char_lumberjack[playerid][Player_Object_DYN][i], char_lumberjack[playerid][Player_Vehicle_ID], 0.0000, -1.0000, 0.2000, 0.0000, 0.0000, 0.0000);
					case 1: AttachObjectToVehicle(char_lumberjack[playerid][Player_Object_DYN][i], char_lumberjack[playerid][Player_Vehicle_ID], 0.0000, -1.7999, 0.2000, 0.0000, 0.0000, 0.0000);
					case 2: AttachObjectToVehicle(char_lumberjack[playerid][Player_Object_DYN][i], char_lumberjack[playerid][Player_Vehicle_ID], 0.0000, -1.7999, 0.6999, 0.0000, 0.0000, 0.0000);
				}
				char_lumberjack[playerid][Player_Tree_Count]++;
				SetPlayerCheckpoint(playerid, DIADIEM_TRAGO, 3);
			}
		}
	}*/
	if(newkeys & KEY_YES) {
		if(GetPVarInt(playerid, "TraHangLumberJack") == 0) {
			if(IsPlayerInRangeOfPoint(playerid, 15, DIADIEM_TRAGO) && char_lumberjack[playerid][Player_Tree_Count] > 0) {
				new Float:X,Float:Y,Float:Z;
				GetVehiclePos(char_lumberjack[playerid][Player_Vehicle_ID], X,Y,Z);		
				if(IsPlayerInRangeOfPoint(playerid, 2.2, X,Y,Z)) {
					SetPVarInt(playerid, "TraHangLumberJack", 1);
					char_lumberjack[playerid][Player_Tree_Count]--;
					SetPlayerCheckpoint(playerid, DIADIEM_TRAGO, 3);
					new i = char_lumberjack[playerid][Player_Tree_Count];
					SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);	
					SetPlayerAttachedObject(playerid, 9, 1463, 1, 0.1539, 0.5870, 0.0000, 0.0000, 84.7999, 0.0000, 0.8460, 0.4109, 0.4190, 0xFFFFFFFF, 0xFFFFFFFF);				
					
					DestroyObject(char_lumberjack[playerid][Player_Object_DYN][i]);
				}
			}
		}
	}
	return 1;
}

hook OnPlayerEnterCheckpoint(playerid) {
	if(IsPlayerInRangeOfPoint(playerid, 3, DIADIEM_TRAGO)) {
		if(GetPVarInt(playerid, "TraHangLumberJack") == 1) {
			if(!IsPlayerInAnyVehicle(playerid)) {

				SetPVarInt(playerid, "TraHangLumberJack", 0);
				ApplyAnimation(playerid, "CARRY", "liftup", 4.1, 0, 0, 0, 0, 0, 1);	

				SendClientMessage(playerid, -1, "[{ccccff}GvR LumberJack{ffffff}]: Ban nhan duoc 10000 Cho Viec Ban Go");
				PlayerInfo[playerid][pCash] += 10000;
				SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
				RemovePlayerAttachedObject(playerid, 9);
				DisablePlayerCheckpoint(playerid);
			
				DeoBietTen[playerid] = 0;


			}
		}
		else SendClientMessage(playerid, -1, "[{ccccff}GvR LumberJack{ffffff}]: Dung gan xe su dung Y de lay hang");
	}
	return 1;
}
/* ========= Functions ========= */
forward CreateTree(i_tree);
forward OnPlayerCompleteSawing(playerid, iTree);
/* ===== Public Func ===== */
public CreateTree(i_tree) {
	new 
		Tree_Object_ID[] = {708,691,616}; // ID Object cua cay 

	new modelid = Tree_Object_ID[random(sizeof Tree_Object_ID)];
	LumberJack[i_tree][lj_Attacked_Player] = INVALID_PLAYER_ID;

	SetTreePostion(i_tree, Tree_Default[i_tree][0], Tree_Default[i_tree][1], Tree_Default[i_tree][2]);
	LumberJack[i_tree][lj_Tree] = CreateObject(modelid, Tree_Default[i_tree][0], Tree_Default[i_tree][1], Tree_Default[i_tree][2]-2, 0,0,0);
	LumberJack[i_tree][lj_Name] = CreateDynamic3DTextLabel("GvR Tree\n/cuacay", -1, Tree_Default[i_tree][0], Tree_Default[i_tree][1], Tree_Default[i_tree][2], 5);
	return 1;
}
public OnPlayerCompleteSawing(playerid, iTree) {
	//new iTree = char_lumberjack[playerid][Player_Attack_Tree]; // Luu tru bien khi cua cay
	if(IsPlayerInRangeOfPoint(playerid, 1.7, LumberJack[iTree][lj_Cro][0],LumberJack[iTree][lj_Cro][1],LumberJack[iTree][lj_Cro][2])) {
		GetFrogKidPos(playerid);
		ClearAnimations(playerid);
		TogglePlayerControllable(playerid, 1);
		RemovePlayerAttachedObject(playerid, 9);	
		SetTreeAttacked(iTree, INVALID_PLAYER_ID);
		char_lumberjack[playerid][Player_Attack_Tree] = INVALID_TREE;

	//	new Player_ID_Tree = CheckPlayerLJ_Invalid(playerid);
		SetTreePostion(iTree, -1,-1,-1);
	
		DestroyObject(LumberJack[iTree][lj_Tree]);
		DestroyDynamic3DTextLabel(LumberJack[iTree][lj_Name]);
		//DestroyObject(char_lumberjack[playerid][Player_Object_DYN][Player_ID_Tree]);
		

	
		SetTimerEx("CreateTree", 15000, 0, "d", iTree); // Respawn cay
		
		DeoBietTen[playerid] ++;

		//
		
		new string[128];

		new i = char_lumberjack[playerid][Player_Tree_Count];
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);	
		char_lumberjack[playerid][Player_Object_DYN][i] = CreateObject(1463, FrPos[0], FrPos[1], FrPos[2],0,0,0);
		format(string, 128, "[{ccccff}GvR Lumberjack{ffffff}]: %d/%d Cay", i+1,MAX_SLOT_TREE);
		SendClientMessage(playerid, -1, string);
		RemovePlayerAttachedObject(playerid, 9);
		switch(i) {
			case 0: AttachObjectToVehicle(char_lumberjack[playerid][Player_Object_DYN][i], char_lumberjack[playerid][Player_Vehicle_ID], 0.0000, -1.0000, 0.2000, 0.0000, 0.0000, 0.0000);
			case 1: AttachObjectToVehicle(char_lumberjack[playerid][Player_Object_DYN][i], char_lumberjack[playerid][Player_Vehicle_ID], 0.0000, -1.7999, 0.2000, 0.0000, 0.0000, 0.0000);
			case 2: AttachObjectToVehicle(char_lumberjack[playerid][Player_Object_DYN][i], char_lumberjack[playerid][Player_Vehicle_ID], 0.0000, -1.7999, 0.6999, 0.0000, 0.0000, 0.0000);
		}
		char_lumberjack[playerid][Player_Tree_Count]++;
		SetPlayerCheckpoint(playerid, DIADIEM_TRAGO, 3);
	}
	else {
		SetTreeAttacked(iTree, INVALID_PLAYER_ID);
		char_lumberjack[playerid][Player_Attack_Tree] = INVALID_TREE;
		SendClientMessage(playerid, -1, "[{ccccff}GvR LumberJack{ffffff}]: Ban da di qua xa cay!");
	}
	return 1;
}
/* ===== Plain Func ===== */
SetTreePostion(i_tree, Float:X,Float:Y,Float:Z) {
	LumberJack[i_tree][lj_Cro][0] = X;
	LumberJack[i_tree][lj_Cro][1] = Y;
	LumberJack[i_tree][lj_Cro][2] = Z;
	return 1;
}
SetTreeAttacked(i_tree, i = INVALID_PLAYER_ID) {
	LumberJack[i_tree][lj_Attacked_Player] = i;
	return 1;
}

/* ===== Stock Func ===== */
stock IsPlayerRangeTree(playerid, Float:range) {
	new i = 0;
	LOOP:(i, MAX_TREES) {
		if(IsPlayerInRangeOfPoint(playerid, range, LumberJack[i][lj_Cro][0],LumberJack[i][lj_Cro][1],LumberJack[i][lj_Cro][2])) {
			return i; // tra ve object neu co cay ke ben 
		}
	}
	return INVALID_TREE;
}
stock CheckPlayerLJ_Invalid(playerid) {
	new i = 0;
	LOOP:(i, 99) {
		if(char_lumberjack[playerid][Player_Object_DYN][i] == INVALID_OBJECT_ID) {
			return i;
		}
	}
	return -1;
}
ThoiGianLamViec()
{
    new Hour; 
    gettime(Hour); 
    if(Hour > 6 || Hour < 22)
    {
        return 0; 
    }
    return 1;
}

CMD:cuacay(playerid) {
	if(DeoBietTen[playerid] < MAX_SLOT_TREE) {
		if(char_lumberjack[playerid][Player_Tree_Count] < MAX_SLOT_TREE) {
			if(char_lumberjack[playerid][Player_Vehicle_ID] != INVALID_VEHICLE_ID) {
				new iTree = IsPlayerRangeTree(playerid, 1.7); 
				if(iTree == INVALID_TREE) { // Khong dung gan cay nao
					SendClientMessage(playerid, -1, "[{ccccff}GvR LumberJack{ffffff}]: Ban khong dung gan cay nao!");
				}
				if(ThoiGianLamViec())
				{
        		return SendClientMessage(playerid, -1, "Chat Go Da bi khoa 6h sang moi co the bat dau lam viec");
    			}
				else { // Da xac nhan duoc cay 
					if(LumberJack[iTree][lj_Attacked_Player] != INVALID_PLAYER_ID) { // Kiem tra cay da bi tan cong chua
						// '!=' Thuoc da co nguoi tan cong
						new name[32],string[128];
						GetPlayerName(LumberJack[iTree][lj_Attacked_Player], name, 32); // Lay ten cua nguoi so huu
						format(string, 128, "[{ccccff}GvR LumberJack{ffffff}]: Cay nay thuoc quyen so huu cua %s", name);
						SendClientMessage(playerid, -1, string);
					}
					else { // Else thuoc cay chua co nguoi so huu
						if(char_lumberjack[playerid][Player_Attack_Tree] != INVALID_TREE) { // Kiem tra nguoi choi co so huu cay nao khong
							// '!=' Thuoc dang tan cong 
							SendClientMessage(playerid, -1, "[{ccccff}GvR LumberJack{ffffff}]: Khong the lam dieu do vao luc nay!");
						}
						else { // Nguoi choi khong cua cay
							if(IsPlayerInAnyVehicle(playerid)) { // Tren xe khong duoc chat
								SendClientMessage(playerid, -1, "[{ccccff}GvR LumberJack{ffffff}]: Khong the lam dieu do vao luc nay!");
							}
							else {
								if(GetPVarInt(playerid, "Injured") == 1) {					
									SendClientMessage(playerid, -1, "[{ccccff}GvR LumberJack{ffffff}]: Khong the lam dieu do vao luc nay!");
								}
								else { // Bat dau cua cay, da thoa mang dieu kien
									SetTreeAttacked(iTree, playerid); // Set cay da co nguoi cua
									char_lumberjack[playerid][Player_Attack_Tree] = iTree; // Luu tru bien
									
									SetPlayerArmedWeapon(playerid, 0);
									TogglePlayerControllable(playerid, 0);
									SetPlayerAttachedObject(playerid, 9, 341, 6);
									ApplyAnimation(playerid, "CHAINSAW", "WEAPON_csaw", 4.1, 1, 0, 0, 1, 0, 1);

									char_lumberjack[playerid][PlayerTime_LumberJack] = SetTimerEx("OnPlayerCompleteSawing", 8000, 0, "dd", playerid, iTree);
								//	printf("DEBUG: Tree%d", iTree);
								}
							}
						}
					}
				}
			}
			else SendClientMessage(playerid, -1, "[{ccccff}GvR LumberJack{ffffff}]:Ban can thue 1 chiec xe de lam cong viec nay!");
		}
		else SendClientMessage(playerid, -1, "[{ccccff}GvR LumberJack{ffffff}]: 3/3 ban can di giao go");
	}
	else SendClientMessage(playerid, -1, "[{ccccff}GvR LumberJack{ffffff}]: 3/3 ban di vac go"); // bao cai nao
	return 1;
}
CMD:layxecongviec(playerid) {
	if(IsPlayerInRangeOfPoint(playerid, 3, KV_LAYXE_LJ)) {
		if(char_lumberjack[playerid][Player_Vehicle_ID] == INVALID_VEHICLE_ID) {
			char_lumberjack[playerid][Player_Vehicle_ID] = CreateVehicle(478, KV_LAYXE_LJ, 90, -1, -1, -1);
			SendClientMessage(playerid, -1, "[{ccccff}GvR LumberJack{ffffff}]: Dua bo go len xe de hoan thanh cong viec!");
			SendClientMessage(playerid, -1, "[{ccccff}GvR LumberJack{ffffff}]: Toi da bo' go la 3");
			PutPlayerInVehicle(playerid, char_lumberjack[playerid][Player_Vehicle_ID], 0);
		}
		else {
			SendClientMessage(playerid, -1, "[{ccccff}GvR LumberJack{ffffff}]: Ban khong the lay them!");
		}
	}
	return  1;
}
CMD:traxecongviec(playerid) {
	if(char_lumberjack[playerid][Player_Vehicle_ID] != INVALID_VEHICLE_ID) {
		if(char_lumberjack[playerid][Player_Vehicle_ID] != INVALID_VEHICLE_ID) {
			DestroyVehicle(char_lumberjack[playerid][Player_Vehicle_ID]);
			char_lumberjack[playerid][Player_Vehicle_ID] = INVALID_VEHICLE_ID;
		}
	}
	else {
		SendClientMessage(playerid, -1, "[{ccccff}GvR LumberJack{ffffff}]: Ban khong the tra!");
	}
	return  1;
}
