

#include <a_samp>
#include <ysi\y_hooks>

#define DIALOG_BANRAU 2005

#define RAUMUONG 34 // So luong Spawn
#define INVALID_FLOAT -1

#define THUHOACH_THOIGIAN 5 // 2s = 1 Bo Rau
#define TIME_RESPAWN_RAUBAN 120 // 120s se respawn lai Rau
#define TIME_RUARAU_RAUBAN 5 // 5s = 1 Bo
#define LAMSACH_THOIGIAN 10 // 10s = 1 Bo Rau

#define GIARAUMUONG 2300 // 3k 1 Bo

enum raumuong_enum {
	raumuong_id,
	Text3D:raumuong_label,
	bool:raumuong_status,
	Float:raumuong_X,
	Float:raumuong_Y,
	Float:raumuong_Z,
}

new TimeLamsach[MAX_PLAYERS];
new DynamicCP_Hairau[2]; // 0 = Rua // 1 = Ban
new TimeHairau[MAX_PLAYERS];
new bool:Hairau[MAX_PLAYERS] = false;
new Raumuong[RAUMUONG][raumuong_enum];
new Float:raumuong_pos[RAUMUONG][] = {
{221.0456,1124.9519,13.1747,355.1028}, // hairau
{221.5793,1128.7344,12.8721,351.9694}, // hairau
{222.0058,1131.7576,12.9702,351.9694}, // hairau
{222.3712,1134.3470,13.0310,351.9694}, // hairau
{222.6469,1136.3016,13.0689,351.9694}, // hairau
{222.9742,1138.6216,13.1139,351.9694}, // hairau
{223.4246,1141.8143,13.1759,351.9694}, // hairau
{223.5632,1143.5568,13.2173,355.3116}, // hairau
{223.8014,1145.8933,13.2691,353.6405}, // hairau
{224.0899,1148.4834,13.3248,353.6405}, // hairau
{224.4175,1151.4226,13.3880,353.6405}, // hairau
{224.6379,1153.4001,13.4305,353.6405}, // hairau
{224.8580,1155.3751,13.4730,353.6405}, // hairau
{227.7980,1155.6030,13.2716,264.8620}, // hairau
{228.3479,1153.5494,13.1723,190.0791}, // hairau
{228.7409,1151.3383,13.0795,190.0791}, // hairau
{229.3981,1147.6406,12.9243,190.0791}, // hairau
{230.0393,1144.0336,12.7666,190.0791}, // hairau
{230.6326,1140.6954,12.5566,190.0791}, // hairau
{231.3191,1136.8337,12.3138,190.0791}, // hairau
{231.9283,1133.4067,12.0982,190.0791}, // hairau
{232.5968,1129.6455,11.8617,190.0791}, // hairau
{233.2346,1126.0568,11.9110,190.0791}, // hairau
{233.8890,1122.3746,12.1024,190.0791}, // hairau
{237.1729,1122.2054,11.7922,270.5339}, // hairau
{237.3854,1125.4679,11.5614,0.5340}, // hairau
{237.3449,1129.8177,11.4161,0.5340}, // hairau
{237.3060,1134.0031,11.6120,0.5340}, // hairau
{237.2661,1138.2858,11.8125,0.5340}, // hairau
{237.2328,1141.8597,11.9797,0.5340}, // hairau
{237.1971,1145.6993,12.1594,0.5340}, // hairau
{237.1615,1149.5287,12.3386,0.5340}, // hairau
{237.1324,1152.6543,12.4849,0.5340}, // hairau
{237.1064,1155.4343,12.6078,0.5340} // hairau
};

stock IsPlayerNearRaumuong(playerid, Float:range) {
	for(new i = 0 ; i < RAUMUONG; i ++) {
		if(Raumuong[i][raumuong_X] != INVALID_FLOAT && IsPlayerInRangeOfPoint(playerid, range, Raumuong[i][raumuong_X],Raumuong[i][raumuong_Y],Raumuong[i][raumuong_Z]+0.5)) {
			return i;
		}
	}
	return INVALID_FLOAT;
}

forward RaumuongCreate(iMar);
public RaumuongCreate(iMar) {
	Raumuong[iMar][raumuong_label] = CreateDynamic3DTextLabel("[{00cc00}Rau Muong /thuhoach]", -1, raumuong_pos[iMar][0],raumuong_pos[iMar][1],raumuong_pos[iMar][2]-0.2, 5);
	Raumuong[iMar][raumuong_id] = CreateDynamicObject(874, raumuong_pos[iMar][0],raumuong_pos[iMar][1],raumuong_pos[iMar][2]-1.2, 0,0,0);

	Raumuong[iMar][raumuong_X] = raumuong_pos[iMar][0],
	Raumuong[iMar][raumuong_Y] = raumuong_pos[iMar][1],
	Raumuong[iMar][raumuong_Z] = raumuong_pos[iMar][2];

	Raumuong[iMar][raumuong_status] = false;
	printf("[RAUMUONG] Raumuong %d | X%f | Y%f | Z%f", iMar, Raumuong[iMar][raumuong_X],Raumuong[iMar][raumuong_Y],Raumuong[iMar][raumuong_Z]);
	return 1;
}


forward OnPlayerHarvestLamsach(playerid);
public OnPlayerHarvestLamsach(playerid) {

	// Player
	ClearAnimations(playerid);
	TogglePlayerControllable(playerid, true);
	SendClientMessage(playerid, -1, "{33CC33}[Nong Dan GvR] Ban Nhan 5 Bo Rau Sach Hay Ban Cho Cac Ba Gia Hang Rong");
	PlayerInfo[playerid][pRausach] +=5; // 5 rau sach
	PlayerInfo[playerid][pRauban] -=5; // -5 rau ban
	return 1;
}

forward OnPlayerHarvestRaumuong(playerid, iMar);
public OnPlayerHarvestRaumuong(playerid, iMar) {

	// Player
	ClearAnimations(playerid);
	Hairau[playerid] = false;
	PlayerInfo[playerid][pRauban] ++; // rau + 1
	TogglePlayerControllable(playerid, true);
	SendClientMessage(playerid, -1, "[{00b300}Nong Dan GvR{006600}]: Ban da nhan duoc 1 Bo Rau Ban !");
	// Raumuong Var
	Raumuong[iMar][raumuong_X] = INVALID_FLOAT; //
	DestroyDynamicObject(Raumuong[iMar][raumuong_id]);
	DestroyDynamic3DTextLabel(Raumuong[iMar][raumuong_label]);
	SetTimerEx("RaumuongCreate", TIME_RESPAWN_RAUBAN*1000, 0, "d", iMar);
	// Debug
	printf("Destroy RauMuong %d", iMar);
	return 1;
}

forward OnPlayerCBCannabiss(playerid);
public OnPlayerCBCannabiss(playerid) {
	if(PlayerInfo[playerid][pRauban] >= 1) {
		PlayerInfo[playerid][pRauban] -= 1;
		PlayerInfo[playerid][pRausach] ++;
		SendClientMessage(playerid, -1, "[{00b300}Nong Dan GvR{006600}]: Ban da nhan 1 Bo Rau Sach!");
	}
	else {
		SetPVarInt(playerid, "DangCheBien", 0);
		TogglePlayerControllable(playerid, true); // Freeze player
		SendClientMessage(playerid, -1, "[{00b300}Nong Dan GvR{006600}]: Ban Da Rua Rau Sach Ban Co The Dem Ban Cho Cac Sieu Thi /trogiupnongdan!");
		KillTimer(PlayerInfo[playerid][pRuarauTime]);
	}
	return 1;
}

hook OnGameModeInit() {
	new i = 0;
	while(i < RAUMUONG) {
		RaumuongCreate(i);
		i ++;
	}

	CreateActor(53,-214.2878,1091.5020,19.7422,357.5443); //NPC BAN RAU
	CreateActor(53,-218.6958,1091.4072,19.7422,355.6642); //NPC chua co lam gi
	CreateActor(39,-489.1620,610.9698,1.7739,357.7932); // NPC rua rau
	CreateActor(158,220.9603,1118.4874,13.6345,348.3452); // NPCNONGDAN
	CreateObject(3861, -218.72246, 1091.78601, 19.90262,   0.00000, 0.00000, 179.06691); // quay ban hang
	CreateObject(3861, -214.24908, 1091.87744, 19.90262,   0.00000, 0.00000, 179.06691); // quay ban hang
	CreateDynamic3DTextLabel("{009933}Vi Tri Rua Sach Rau\n/lamsach\nDe Thuc Hien", COLOR_YELLOW, -489.1620,610.9698,1.7739+0.6,18.0);
	CreateDynamic3DTextLabel("{CC0033}Ba Ban Rau\n{009900}/banrau", COLOR_YELLOW, -214.2878,1091.5020,19.7422+0.6,18.0);
	CreateDynamic3DTextLabel("{009933}Nong Dan", COLOR_YELLOW, 220.9603,1118.4874,13.6345+0.6,18.0);
	//DynamicCP_Hairau[0] = CreateDynamicCP(-489.1620,610.9698,1.7739, 1, .streamdistance = 2); // Rua
	DynamicCP_Hairau[1] = CreateDynamicCP(-29.0181,-185.1304,1003.5469, 1, .streamdistance = 2); // Ban
	return 1;
}

hook OnPlayerDisconnect(playerid, reason) {
	if(Hairau[playerid] == true) { // Kiem tra neu nguoi choi dang thu hoach
		KillTimer(TimeHairau[playerid]); // Dung timer.
		Raumuong[GetPVarInt(playerid, "_iRaumuong")][raumuong_status] = false; // Rau co the thu hoach
	}
	if(GetPVarInt(playerid, "DangCheBien") == 1) {
		KillTimer(PlayerInfo[playerid][pRuarauTime]);
	}
	return 1;
}


hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
	if(dialogid == DIALOG_BANRAU) {
		if(response) {
			if(strval(inputtext) > 0) {
				if(PlayerInfo[playerid][pRausach] >= strval(inputtext)) {
					new string[128];
					PlayerInfo[playerid][pRausach] -= strval(inputtext);
					GivePlayerCash(playerid, strval(inputtext)*GIARAUMUONG);
					format(string, 128, "[{00b300}Nong Dan GvR{006600}]: Ban da ban %d Rau Sach va nhan duoc $%d", strval(inputtext), strval(inputtext)*GIARAUMUONG);
					SendClientMessage(playerid, -1, string);
				}
				else
					SendClientMessage(playerid, -1,"[{00b300}Nong Dan GvR{006600}]: So luong khong hop le! hay kiem tra lai so luong cua ban");
			}
			else
				SendClientMessage(playerid, -1,"[{00b300}Nong Dan GvR{006600}]: So luong can ban phai lon hon 0!");
		}
	}
	return 1;
}


CMD:kiemtrasoluong(playerid) {
	new string[32+11];
	SendClientMessageEx(playerid, -1,"Tong So Luong Rau Ban Va Sach Cua Ban.");
	format(string, 32+11, "{00CC00}Rau Ban So Luong: %d", PlayerInfo[playerid][pRauban]);
	SendClientMessage(playerid, -1, string);
	format(string, 32+11, "{33CC00}Rau Sach So Luong: %d", PlayerInfo[playerid][pRausach]);
	SendClientMessage(playerid, -1, string);
	return 1;
}
CMD:thuhoach(playerid) {
	new iRaumuong = IsPlayerNearRaumuong(playerid, 1);
    if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Xuong xe de ban ey");
	if(PlayerCuffed[playerid] >= 1 || PlayerInfo[playerid][pJailTime] > 0 || GetPVarInt(playerid, "Injured")) return SendClientMessageEx( playerid, COLOR_WHITE, "Ban khong the lam dieu do vao luc nay" );
	//if(iRaumuong == INVALID_FLOAT) SendClientMessage(playerid, -1, "[{00b300}Nong Dan GvR{006600}]: Ban khong dung gan cay nao de thu hoach ca!");
	else {
		if(Raumuong[iRaumuong][raumuong_status] == false) {
			if(Hairau[playerid] == false) {
				if(PlayerInfo[playerid][pRauban] < 25) {
					Hairau[playerid] = true; // Bat dau hai
					Raumuong[iRaumuong][raumuong_status] = true; // Chuyen trang thai tu chua bi hai thanh bi hai cua can sa
					TogglePlayerControllable(playerid, false); // Freeze nguoi choi lai.
					SetPVarInt(playerid, "_iRaumuong", iRaumuong);
					ApplyAnimation(playerid, "BOMBER", "BOM_Plant_Loop", 4.1, 1, 0, 0, 1, 0); // Thuc hien thanh dong (RP)
					SendClientMessage(playerid, -1, "[{00b300}Nong Dan GvR{006600}]: Ban dang Thu Hoach");
					SendClientMessage(playerid, -1, "[{00b300}Nong Dan GvR{006600}]: Voi Long Doi Chut...");
					TimeHairau[playerid] = SetTimerEx("OnPlayerHarvestRaumuong", THUHOACH_THOIGIAN*1000, 0, "ii", playerid, iRaumuong); // Timer thu hoach
				}
				else
					SendClientMessage(playerid, -1, "[{00b300}Nong Dan GvR{006600}]: So Luong Trong Nguoi Cua Ban Da Day Ban Can Di Lam Sach");
			}
			else
				SendClientMessage(playerid, -1, "[{00b300}Nong Dan GvR{006600}]: Ban khong the thuc hien vao luc nay!");
		}
		else
			SendClientMessage(playerid, -1, "[{00b300}Nong Dan GvR{006600}]:dang co nguoi thu hoach hay tim cho khac");
	}
	return 1;
}
CMD:lamsach(playerid)
{
		if (IsPlayerInRangeOfPoint(playerid, 3.0, -489.1620,610.9698,1.7739))
        {
				if(PlayerInfo[playerid][pRauban] >= 5) { // rau ban > rau sach
			{
				if(GetPVarInt(playerid, "DangCheBien") == 0)
			  {
			   	TogglePlayerControllable(playerid, false); // Freeze nguoi choi lai.
				ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 1, 0, 0, 1, 0); // Thuc hien thanh dong (RP)
				TimeLamsach[playerid] = SetTimerEx("OnPlayerHarvestLamsach", LAMSACH_THOIGIAN*1000, 0, "ii", playerid); // Timer Lam Sach
}
				}
				
			}
				else
				SendClientMessage(playerid, -1,"[{00b300}Nong Dan GvR{33CC33}]:Ban Can So Luong 5 Rau Ban Moi Co The Rua!");	
	
		}
		else
		SendClientMessage(playerid, -1, "Ban Khong Dung Gan Vi Tri Rua Rau");

		return 1;
}
CMD:banrau(playerid)
{
	if (IsPlayerInRangeOfPoint(playerid, 5.0, -214.2878,1091.5020,19.7422)) 
	{
	ShowPlayerDialog(playerid, DIALOG_BANRAU, DIALOG_STYLE_INPUT, "Ban Rau Sach", "Vui Long Nhap So Luong", "O", "X");
	}
	else SendClientMessage(playerid, -1, "Ban khong o gan quay ban hang");
	return 1;
}

 