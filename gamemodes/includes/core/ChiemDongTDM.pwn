#include <a_samp>
#include <YSI\y_hooks>


new Text3D:DDChiemDong[3];

#define TRANGTHAICD (9912)
#define         CHIEMDONGDL         (8811)
#define         CHIEMDONGTB          (8812)

enum Chiemdong
{
	DaChiemDong1,
    Text3D:CDText,
    Float:kX,
    Float:kY,
    Float:kZ,
}

new ChiemDongGuild[120];
new Text3D:KHUVUCCHIEM[120];
new ChiemDongCheck[Chiemdong];



hook OnGameModeInit()
{
    KHUVUCCHIEM[1] = Create3DTextLabel("{ff0000}KHU VUC CHIEM DONG{FFFFFF}\nKho Vat Lieu\nSu dung : /chiemdongguild", -1, -1820.52,-159.72,9.39, 12.0, 0);
	return 1;
}

task CDReloadTime[6000000](playerid)
{
	//
    ChiemDongCheck[DaChiemDong1] = 0;
    Delete3DTextLabel(KHUVUCCHIEM[1]);
    //CreateDynamicPickup(11245, 23, -1820.52,-159.72,9.39, -1); // 
    KHUVUCCHIEM[1] = Create3DTextLabel("{ff0000}KHU VUC CHIEM DONG{FFFFFF}\nKho Vat Lieu\nSu dung : /chiemdongguild", -1, -1820.52,-159.72,9.39, 12.0, 0);
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == TRANHTHAICD)
	{
      if(response)
      {
      if(listitem == 0)
      {
          SetPlayerCheckpoint(playerid, -1820.52,-159.72,9.39, 3.0);
          CP[playerid] = 252000;
      }
    }
    return 1;
} 

forward KHUVUC1(playerid);
public KHUVUC1(playerid)
{
    SetPVarInt(playerid, "KHUVUC1TIME", GetPVarInt(playerid, "KHUVUC1TIME")-1);
    new string[12800];
    new iGroupID = PlayerInfo[playerid][pMember];
  //  format(string, sizeof(string), "~n~~n~~n~~n~~n~~n~~n~~n~~n~~w~%d giay con lai", GetPVarInt(playerid, "KHUVUC1TIME"));
  //  GameTextForPlayer(playerid, string, 1100, 3);
    if(!IsPlayerInRangeOfPoint(playerid, 15.0, -1820.52,-159.72,9.39))
    {
        SendClientMessage(playerid, -1, "Ban da di qua xa chiem dong that bai");
        Delete3DTextLabel(KHUVUCCHIEM[1]);
       // CreateDynamicPickup(11245, 23, -1820.52,-159.72,9.39, -1); // 
        KHUVUCCHIEM[1] = Create3DTextLabel("{ff0000}KHU VUC CHIEM DONG{FFFFFF}\nKho Vat Lieu\nSu dung : /chiemdongguild", -1, -1820.52,-159.72,9.39, 12.0, 0);
        return 1; 
    }
  //  ApplyAnimation(playerid, "COP_AMBIENT", "Copbrowse_loop", 4.1, 1, 0, 0, 0, 0, 1);
    if(GetPVarInt(playerid, "KHUVUC1TIME") > 0) SetTimerEx("KHUVUC1", 1000, 0, "d", playerid);

    foreach(new i: Player)
	{
    if(GetPVarInt(playerid, "KHUVUC1TIME") <= 0)
    {
        Delete3DTextLabel(KHUVUCCHIEM[1]);

        new iGroupID = PlayerInfo[playerid][pMember];
        DeletePVar(playerid, "KHUVUC1TIME");
        DeletePVar(playerid, "KHUVUC1");
        ClearAnimations(playerid);
        PlayerInfo[playerid][pCredits] += 300;
        PlayerInfo[playerid][pPot] += 50;
        PlayerInfo[playerid][pCrack] += 50;
        SendClientMessageEx(playerid, COLOR_GRAD2, "[CHIEM DONG GUILD] Ban da chiem thanh cong, khu vuc nay cho guild minh , ban nhan duoc 500 coin, 50 pot va crack!");
        format(string, sizeof(string), "[CHIEM DONG GUILD]: {00ff00}%s{ffffff} [GUILD : {00ffff}%s{ffffff}]da chiem thanh cong {ff0000}[Kho Vat Lieu]{ffffff} cho GUILD minh.", GetPlayerNameEx(playerid), arrGroupData[iGroupID][g_szGroupName]);
        SendClientMessageToAllEx(COLOR_YELLOW, string);
        GangZoneShowForAll(ChiemDongGuild[1], arrGroupData[iGroupID][g_hDutyColour] * 256 + 255);
        ChiemDongCheck[DaChiemDong1] = 1;
        SetPVarInt(i, "CDtime", gettime() + 6000);

		format(string, sizeof(string), "{ff0000}KHU VUC CHIEM DONG{FFFFFF}\nKho Vat Lieu\n{008000}Nguoi chiem : %s {ffffff}\nGuild: {00ffff}%s{ffffff}\nBao ve khu vuc nay , neu khong ban co the bi nguoi khac chiem'", GetPlayerNameEx(playerid), arrGroupData[iGroupID][g_szGroupName]);
		KHUVUCCHIEM[1] = Create3DTextLabel(string, -1, -1820.52,-159.72,9.39, 12.0, 0);
        return 1;
    }
    }
    return 1;
}


CMD:chiemdongguild(playerid, params[])
{
    if(IsPlayerInRangeOfPoint(playerid, 5.0, -1820.52,-159.72,9.39)) // Kho vat lieu
	{
        if(ChiemDongCheck[DaChiemDong1] == 1)
	 	{
			SendClientMessage(playerid, COLOR_GREY, "[CHIEM DONG GUILD] Ai do da chiem dong khu vuc nay.");
	    	return 1;
	    }
		if(PlayerInfo[playerid][pMember] >= 0 && arrGroupData[PlayerInfo[playerid][pMember]][g_hDutyColour] != 0xFFFFFF)
		{
		//    ApplyAnimation(playerid, "COP_AMBIENT", "Copbrowse_loop", 4.1, 1, 0, 0, 0, 0, 1);
		    SetPVarInt(playerid, "KHUVUC1TIME", 50);
            SetTimerEx("KHUVUC1", 1000, 0, "dd", playerid);
            new string[12800], strings[1280];
            new iGroupID = PlayerInfo[playerid][pMember];
            Delete3DTextLabel(KHUVUCCHIEM[1]);
            format(strings, sizeof(strings), "{ff0000}KHU VUC CHIEM DONG{FFFFFF}\nKho Vat Lieu\n{008000}Nguoi dang chiem : %s {ffffff}\nGuild: {00ffff}%s{ffffff}", GetPlayerNameEx(playerid), arrGroupData[iGroupID][g_szGroupName]);
            KHUVUCCHIEM[1] = Create3DTextLabel(strings, -1, -1820.52,-159.72,9.39, 12.0, 0);
            format(string, sizeof(string), "[CHIEM DONG GUILD]: {00ff00}%s{ffffff} [GUILD : {00ffff}%s{ffffff}] dang chiem {ff0000}[Kho Vat Lieu]{ffffff}.", GetPlayerNameEx(playerid), arrGroupData[iGroupID][g_szGroupName]);
            SendClientMessageToAllEx(COLOR_YELLOW, string);

		}else return SendClientMessageEx(playerid, COLOR_YELLOW,"[CHIEM DONG GUILD] Ban khong o trong [GUILD/TEAM] nao het , nen khong the chiem.");
    }else return SendClientMessageEx(playerid, COLOR_YELLOW,"[CHIEM DONG GUILD] Ban khong o noi de chiem.");
	return 1;
}

CMD:vitricd(playerid, params[])
{
    new string[1080];
    format(string, 1080, "Khu vuc \t Trang thai\n\
    {00FFED}Kho Vat Lieu \t %s", GetTrangThai(ChiemDongCheck[DaChiemDong1]));
    ShowPlayerDialog(playerid, TRANGTHAICD, DIALOG_STYLE_TABLIST_HEADERS, "Khu Vuc Chiem Dong Guild",  string, "Dong y", "Thoat");
    return 1;
}

stock GetTrangThai(trangthaicd)
{
	new name[82];
	switch(trangthaicd)
	{
		case 0: name = "{07FF00}Chua Bi Chiem{ffffff}";
		case 1: name = "{FF1800}Da Bi Chiem{ffffff}";
	}
	return name;
}

enum ChiemDongEnum
{
    TimeChiemDong,
    DaChiemDong1,
    DaChiemDong2,
    DaChiemDong3,
    TimeSauCD,
    BaoVeChiemDong
}
new CheckCD[ChiemDongEnum];
hook OnGameModeInit()
{
    DDChiemDong[0] = Create3DTextLabel("Kho Vat Lieu \nTrang Thai : {00FF00}An Toan",-1,-1822.0242,-173.9640,9.3984,50,0);
    DDChiemDong[1] = Create3DTextLabel("Kho Vu Khi \nTrang Thai : {00FF00}An Toan",-1,-2323.4187,-132.0361,35.3203,50,0);
    DDChiemDong[2] = Create3DTextLabel("Kho Mafia \nTrang Thai : {00FF00}An Toan",-1,-2775.0571,14.5541,7.1875,50,0);
    return 1;
}

CMD:chiem(playerid, params[])
{
    if(IsPlayerInRangeOfPoint(playerid,10.0,-1822.0242,-173.9640,9.3984))
    {
        if(CheckCD[DaChiemDong1] == 0)
        {
            if(PlayerInfo[playerid][pMember] >= 0 && arrGroupData[PlayerInfo[playerid][pMember]][g_hDutyColour] != 0xFFFFFF)
            {
                ApplyAnimation(playerid,"BOMBER", "BOM_Plant", 4.1, 1, 0, 0, 0, 0, 1);
                SetTimerEx("ChiemDongKhu1",1000,0,"i",playerid);
                SetPVarInt(playerid,"ThoiGianChiemDong",10);
            }
            else SendClientMessage(playerid,COLOR_YELLOW,"Ban Khong O Trong [ Guild / Team ] Nao Het");
        }
        else SendClientMessageEx(playerid,COLOR_YELLOW,"Khu Nay Da Co Nguoi Chiem Dong");
    }
    // __________________________________________________________________________________________
    // Khu Vuc 2
    // __________________________________________________________________________________________
    else if(IsPlayerInRangeOfPoint(playerid,5.0,-2323.4187,-132.0361,35.3203))
    {
        if(CheckCD[DaChiemDong2] == 0)
        {
            if(PlayerInfo[playerid][pMember] >= 0 && arrGroupData[PlayerInfo[playerid][pMember]][g_hDutyColour] != 0xFFFFFF)
            {
                ApplyAnimation(playerid,"BOMBER", "BOM_Plant", 4.1, 1, 0, 0, 0, 0, 1);
                SetTimerEx("ChiemDongKhu2",1000,0,"i",playerid);
                SetPVarInt(playerid,"ThoiGianChiemDong1",10);
            }
            else SendClientMessage(playerid,COLOR_YELLOW,"Ban Khong O Trong [ Guild / Team ] Nao Het");
        }
        else SendClientMessageEx(playerid,COLOR_YELLOW,"Khu Nay Da Co Nguoi Chiem Dong");
    }
    // __________________________________________________________________________________________
    // Khu Vuc 3
    // __________________________________________________________________________________________
    else if(IsPlayerInRangeOfPoint(playerid,5.0,-2775.0571,14.5541,7.1875))
    {
        if(CheckCD[DaChiemDong3] == 0)
        {
            if(PlayerInfo[playerid][pMember] >= 0 && arrGroupData[PlayerInfo[playerid][pMember]][g_hDutyColour] != 0xFFFFFF)
            {
                ApplyAnimation(playerid,"BOMBER", "BOM_Plant", 4.1, 1, 0, 0, 0, 0, 1);
                SetTimerEx("ChiemDongKhu3",1000,0,"i",playerid);
                SetPVarInt(playerid,"ThoiGianChiemDong2",10);
            }
            else SendClientMessage(playerid,COLOR_YELLOW,"Ban Khong O Trong [ Guild / Team ] Nao Het");
        }
        else SendClientMessageEx(playerid,COLOR_YELLOW,"Khu Nay Da Co Nguoi Chiem Dong");
    }
    else SendClientMessageEx(playerid,COLOR_YELLOW,"Ban Khong O Bat Cu Dia Diem Chiem Dong Nao Het");
	return 1;
}

forward ChiemDongKhu1(playerid);
public ChiemDongKhu1(playerid)
{
    SetPVarInt(playerid, "ThoiGianChiemDong", GetPVarInt(playerid, "ThoiGianChiemDong")-1);
    new string[1280];
    format(string, sizeof(string), "~n~~n~~n~~n~~n~~n~~n~~n~~n~~w~%d giay con lai", GetPVarInt(playerid, "ThoiGianChiemDong"));
    GameTextForPlayer(playerid, string, 1100, 3);
    ApplyAnimation(playerid, "COP_AMBIENT", "Copbrowse_loop", 4.1, 1, 0, 0, 0, 0, 1);
    if(GetPVarInt(playerid, "ThoiGianChiemDong") > 0) SetTimerEx("ChiemDongKhu1", 1000, 0, "d", playerid);

    if(GetPVarInt(playerid, "ThoiGianChiemDong") <= 0)
    {
        CheckCD[DaChiemDong1] = 1;
        ClearAnimations(playerid);
        DeletePVar(playerid,"ThoiGianChiemDong");
        new szchiemdong[128];
        format(szchiemdong ,sizeof(szchiemdong),"Kho Vat Lieu \nTrang Thai : {FF0000}Da Chiem Dong \n{00FFFF}So Huu: %s",GetPlayerNameEx(playerid));
        Update3DTextLabelText(DDChiemDong[0],COLOR_WHITE,szchiemdong);
        
		new cddone[1280];
		PlayerInfo [playerid][pCredits] += 3000;
  		PlayerInfo[playerid][pCrack] += 50;
  		PlayerInfo[playerid][pPot] += 50;
    	format(cddone, sizeof(cddone), "%s Da Chiem Dong Thanh Cong Anh Ta Se Nhan Duoc 3000 Kim Cuong , 50 Crack Va 50 Pot.",GetPlayerNameEx(playerid));
     	SendClientMessageToAllEx(COLOR_LIGHTRED, cddone);
    }
    return 1;
}
forward ChiemDongKhu2(playerid);
public ChiemDongKhu2(playerid)
{
    SetPVarInt(playerid, "ThoiGianChiemDong1", GetPVarInt(playerid, "ThoiGianChiemDong1")-1);
    new string[1280];
    format(string, sizeof(string), "~n~~n~~n~~n~~n~~n~~n~~n~~n~~w~%d giay con lai", GetPVarInt(playerid, "ThoiGianChiemDong1"));
    GameTextForPlayer(playerid, string, 1100, 3);
    ApplyAnimation(playerid, "COP_AMBIENT", "Copbrowse_loop", 4.1, 1, 0, 0, 0, 0, 1);
    if(GetPVarInt(playerid, "ThoiGianChiemDong1") > 0) SetTimerEx("ChiemDongKhu2", 1000, 0, "d", playerid);

    if(GetPVarInt(playerid, "ThoiGianChiemDong1") <= 0)
    {
        ClearAnimations(playerid);
        DeletePVar(playerid,"ThoiGianChiemDong1");
        CheckCD[DaChiemDong2] = 1;
        new szchiemdong[128];
        format(szchiemdong ,sizeof(szchiemdong),"Kho Vu Khi \nTrang Thai : {FF0000}Da Chiem Dong \n{00FFFF}So Huu: %s",GetPlayerNameEx(playerid));
        Update3DTextLabelText(DDChiemDong[1],COLOR_WHITE,szchiemdong);
        
		new cddone[1280];
		PlayerInfo [playerid][pCredits] += 3000;
  		PlayerInfo[playerid][pCrack] += 50;
  		PlayerInfo[playerid][pPot] += 50;
    	format(cddone, sizeof(cddone), "%s Da Chiem Dong Thanh Cong Anh Ta Se Nhan Duoc 3000 Kim Cuong , 50 Crack Va 50 Pot.",GetPlayerNameEx(playerid));
     	SendClientMessageToAllEx(COLOR_LIGHTRED, cddone);
    }
    return 1;
}
forward ChiemDongKhu3(playerid);
public ChiemDongKhu3(playerid)
{
    SetPVarInt(playerid, "ThoiGianChiemDong2", GetPVarInt(playerid, "ThoiGianChiemDong2")-1);
    new string[1280];
    format(string, sizeof(string), "~n~~n~~n~~n~~n~~n~~n~~n~~n~~w~%d giay con lai", GetPVarInt(playerid, "ThoiGianChiemDong2"));
    GameTextForPlayer(playerid, string, 1100, 3);
    ApplyAnimation(playerid, "COP_AMBIENT", "Copbrowse_loop", 4.1, 1, 0, 0, 0, 0, 1);
    if(GetPVarInt(playerid, "ThoiGianChiemDong2") > 0) SetTimerEx("ChiemDongKhu3", 1000, 0, "d", playerid);

    if(GetPVarInt(playerid, "ThoiGianChiemDong2") <= 0)
    {
        ClearAnimations(playerid);
        CheckCD[DaChiemDong3] = 1;
        DeletePVar(playerid,"ThoiGianChiemDong2");
        new szchiemdong[128];
        format(szchiemdong ,sizeof(szchiemdong),"Kho Mafia \nTrang Thai : {FF0000}Da Chiem Dong \n{00FFFF}So Huu: %s",GetPlayerNameEx(playerid));
        Update3DTextLabelText(DDChiemDong[2],COLOR_WHITE,szchiemdong);

		new cddone[1280];
		PlayerInfo [playerid][pCredits] += 3000;
  		PlayerInfo[playerid][pCrack] += 50;
  		PlayerInfo[playerid][pPot] += 50;
    	format(cddone, sizeof(cddone), "%s Da Chiem Dong Thanh Cong Anh Ta Se Nhan Duoc 3000 Kim Cuong , 50 Crack Va 50 Pot.",GetPlayerNameEx(playerid));
     	SendClientMessageToAllEx(COLOR_LIGHTRED, cddone);
    }
    return 1;
}

task ResetChiemDong[180000]()
{
    if(CheckCD[DaChiemDong1] == 1)
    {
        Delete3DTextLabel(DDChiemDong[0]);
        SendClientMessageToAll(-1,"Khu Vuc Chiem Dong 1 Da Duoc Mo Lai");
        CheckCD[DaChiemDong1] = 0;
        DDChiemDong[0] = Create3DTextLabel("Kho Vat Lieu \nTrang Thai : {00FF00}An Toan",-1,-1822.0242,-173.9640,9.3984,50,0);
    }
    if(CheckCD[DaChiemDong1] == 1)
    {
        Delete3DTextLabel(DDChiemDong[1]);
        CheckCD[DaChiemDong2] = 0;
        SendClientMessageToAll(-1,"Khu Vuc Chiem Dong 2 Da Duoc Mo Lai");
        DDChiemDong[1] = Create3DTextLabel("Kho Vu Khi \nTrang Thai : {00FF00An Toan",-1,-2323.4187,-132.0361,35.3203,50,0);
    }
    if(CheckCD[DaChiemDong3] == 1)
    {
        CheckCD[DaChiemDong3] = 0;
        Delete3DTextLabel(DDChiemDong[2]);
        SendClientMessageToAll(-1,"Khu Vuc Chiem Dong 3 Da Duoc Mo Lai");
        DDChiemDong[2] = Create3DTextLabel("Kho Mafia \nTrang Thai : {00FF00}An Toan",-1,-2775.0571,14.5541,7.1875,50,0);
    }
}

/*hook OnPlayerUpdate(playerid)
{
    if(CheckCD[DaChiemDong1] == 1)
    {
        if(!IsPlayerInRangeOfPoint(playerid,10.0,-1822.0242,-173.9640,9.3984))
        CheckCD[DaChiemDong1] = 0;
        SendClientMessageEx(playerid,COLOR_WHITE,"Ban Da Roi Khoi Khu Vuc Chiem Dong");
        //|| IsPlayerInRangeOfPoint(playerid,10.0,-2323.4187,-132.0361,35.3203) || IsPlayerInRangeOfPoint(playerid,10.0,-2775.0571,14.5541,7.1875))
    }
    if(CheckCD[DaChiemDong2] == 1)
    {
        if(!IsPlayerInRangeOfPoint(playerid,10.0,-2323.4187,-132.0361,35.3203))
        CheckCD[DaChiemDong2] = 0;
        SendClientMessageEx(playerid,COLOR_WHITE,"Ban Da Roi Khoi Khu Vuc Chiem Dong");
        //|| IsPlayerInRangeOfPoint(playerid,10.0,-2323.4187,-132.0361,35.3203) || IsPlayerInRangeOfPoint(playerid,10.0,-2775.0571,14.5541,7.1875))
    }
    if(CheckCD[DaChiemDong3] == 1)
    {
        if(!IsPlayerInRangeOfPoint(playerid,10.0,-2775.0571,14.5541,7.1875))
        CheckCD[DaChiemDong3] = 0;
        SendClientMessageEx(playerid,COLOR_WHITE,"Ban Da Roi Khoi Khu Vuc Chiem Dong");
        //|| IsPlayerInRangeOfPoint(playerid,10.0,-2323.4187,-132.0361,35.3203) || IsPlayerInRangeOfPoint(playerid,10.0,-2775.0571,14.5541,7.1875))
    }
    return 1;
}*/

CMD:vitricd(playerid, params[])
{
    new string[1080];
    format(string, 1008, "Khu vuc \t Trang thai \n\
    {00FFED}Kho Vat Lieu \t %s \n\
    {00FFED}Kho Vu Khi \t %s \n\
    {00FFED}Kho Vat Lieu \t %s ", GetTrangThai(CheckCD[DaChiemDong1]),GetTrangThai(CheckCD[DaChiemDong2]),GetTrangThai(CheckCD[DaChiemDong3]));
    ShowPlayerDialog(playerid, CHIEMDONGDL, DIALOG_STYLE_TABLIST_HEADERS, "Chiem Dong - Trang Thai",  string, "Dong y", "Thoat");
    return 1;
}
stock GetTrangThai(trangthaicd)
{
    new name[82];
    switch(trangthaicd)
    {
        case 0: name = "{07FF00}Chua Bi Chiem{ffffff}";
        case 1: name = "{FF1800}Da Bi Chiem{ffffff}";
    }
    return name;
}
hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == CHIEMDONGDL)
    {
        if(response)
        {
            if(listitem == 0)
            {
                SetPlayerCheckpoint(playerid,-1822.0242,-173.9640,9.3984,5);
                PlayerPlaySound(playerid,1135,0,0,0);
                SetPVarInt(playerid,"Checkpoint", 10);
            }
            if(listitem == 1)
            {
                SetPlayerCheckpoint(playerid,-2323.4187,-132.0361,35.3203,5);
                PlayerPlaySound(playerid,1135,0,0,0);
                SetPVarInt(playerid,"Checkpoint", 10);
            }
            if(listitem == 2)
            {
                SetPlayerCheckpoint(playerid,-2775.0571,14.5541,7.1875,5);
                PlayerPlaySound(playerid,1135,0,0,0);
                SetPVarInt(playerid,"Checkpoint", 10);
            }
        }
    }
    return 1;
}
hook OnPlayerConnect(playerid)
{
    CheckCD[DaChiemDong1] = 0;
    CheckCD[DaChiemDong2] = 0;
    CheckCD[DaChiemDong3] = 0;
    return 1;
}
hook OnPlayerEnterCheckpoint(playerid)
{
    if(GetPVarInt(playerid,"Checkpoint") == 10)
    {
        DeletePVar(playerid,"Checkpoint");
        DisableCheckPoint(playerid);
        PlayerPlaySound(playerid,1135,0,0,0);
        ShowPlayerDialog(playerid,CHIEMDONGTB,DIALOG_STYLE_MSGBOX,"Chiem Dong - Checkpoint","{FFFF00}Ban Da Den Dia Diem Chiem Dong{FFFFFF} \n [{00FF00}/chiem{FFFFFF}] De Chiem Dong Nhe","Tiep","");
    }
    return 1;
}
