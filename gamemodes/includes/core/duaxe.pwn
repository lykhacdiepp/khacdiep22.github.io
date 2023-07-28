new XeDuaP[MAX_PLAYERS] = INVALID_VEHICLE_ID;
new Float:LastPostDX[MAX_PLAYERS][3],LastInterior[MAX_PLAYERS],LastVW[MAX_PLAYERS];
new bool:OpenDuaXe = false;
CMD:duaxeopen(playerid,params[] ) {
    if(PlayerInfo[playerid][pAdmin] > 2) {
        if(OpenDuaXe == true) {
            OpenDuaXe = false;
            SendClientMessageToAll(-1, "[*] He thong dua xe da bi Admin khoa .");
        }
        else if(OpenDuaXe == false) {
            OpenDuaXe = true;
            SendClientMessageToAll(-1, "[*] He thong dua xe da duoc Admin Mo[/duaxe id gia tien].");
        }
    }
    return 1;
}
CMD:duaxe(playerid,params[]) {
    new giveplayerid,giatien,string[129];
    if (PlayerInfo[playerid][pJailTime] > 0)
    {
        SendClientMessageEx(playerid,COLOR_GREY,"Ban khong the su dung dien thoai khi dang o trong tu.");
        return 1;
    }
    if(PlayerTied[playerid] != 0 || PlayerCuffed[playerid] != 0)
    {
        SendClientMessageEx(playerid,COLOR_GREY,"Ban khong the su dung dien thoai.");
        return 1;
    }
    if(GetPVarInt(playerid, "Injured") == 1)
    {
        SendClientMessageEx(playerid, COLOR_GREY, "   Khong the sai lenh khi bi thuong!");
        return 1;
    }
    if(GetPVarType(playerid, "PlayerCuffed") || GetPVarType(playerid, "Injured") || GetPVarType(playerid, "IsFrozen")) {
           return SendClientMessage(playerid, COLOR_GRAD2, "Ban khong the lam dieu do vao luc nay!");
    }
    if(sscanf(params, "ii", giveplayerid, giatien))
        return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /duaxe [nguoi dua xe] [gia tien cuoc]");
    if(giatien < 1 || giatien > 20000) return SendClientMessageEx(playerid, COLOR_GREY, "Gia tien phai tu 1-20.000");
    if(GetPVarInt(playerid, "DangDuaXe") == 1) return SendClientMessage(playerid,-1,"Dang dua xe");
    if(giveplayerid == playerid)
        return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the ban credits cho chinh minh.");
    if(GetPVarInt(playerid, "Dang_MoiDuaXe") == 1) return SendClientMessage(playerid,-1,"Ban dang moi 1 nguoi khac roi");
    else if(GetPVarType(giveplayerid, "LoiMoiDuaXe"))
        return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi nay da duoc moi dua xe roi.");
    SetPVarInt(giveplayerid,"LoiMoiDuaXe",1);
    SetPVarInt(giveplayerid,"NguoiMoiDuaXe",playerid);
    SetPVarInt(giveplayerid,"OfferMoiDuaXe",giatien);
    SetPVarInt(playerid,"Dang_MoiDuaXe",1);
    SetPVarInt(playerid,"Dang_NguoiMoiDuaXe",giveplayerid);
    SetPVarInt(playerid,"Dang_OfferMoiDuaXe",giveplayerid);
    format(string, 129, "[DUA XE] %s da moi ban dua xe voi gia cuoc la: %s | /chapnhanduaxe de dua xe", GetPlayerNameEx(playerid),number_format(giatien));
    SendClientMessageEx(giveplayerid, -1, string);
    format(string, 129, "[DUA XE] Ban da moi %s dua xe voi gia cuoc la: %s", GetPlayerNameEx(giveplayerid),number_format(giatien));
    SendClientMessageEx(playerid, -1, string);
    return 1;
}
hook OnPlayerDeath(playerid) {
    if(GetPVarInt(playerid,"DangDuaXe") == 1) {
        TogglePlayerControllable(playerid, 1);
        KillEMSQueue(playerid);
        ClearAnimations(playerid);
        SetPlayerHealth(playerid, 100);
        new playerduaxe;
        playerduaxe = GetPVarInt(playerid, "NguoiDuaXe");
        FinishDuaXeCrash(playerid,playerduaxe);
    }
}
hook OnPlayerDisconnect(playerid, reason) {
    if(GetPVarInt(playerid,"DangDuaXe") == 1) {
        new playerduaxe;
        playerduaxe = GetPVarInt(playerid, "NguoiDuaXe");
        FinishDuaXeCrash(playerid,playerduaxe);
    }
}
CMD:chapnhanduaxe(playerid,params[]) {
    if(GetPVarInt(playerid, "DangDuaXe") == 1) return SendClientMessage(playerid,-1,"Dang dua xe");
    if(GetPVarInt(playerid,"LoiMoiDuaXe") != 1) return SendClientMessage(playerid,-1,"Ban khong co ai moi dua xe");
    StartDuaXe(playerid,GetPVarInt(playerid,"NguoiMoiDuaXe"),GetPVarInt(playerid,"OfferMoiDuaXe"));
    return 1;
}
StartDuaXe(player1,player2,giatien) {
    GetPlayerPos(player1, LastPostDX[player1][0],LastPostDX[player1][1],LastPostDX[player1][2]);
    GetPlayerPos(player2, LastPostDX[player2][0],LastPostDX[player2][1],LastPostDX[player2][2]);

    LastInterior[player1] = GetPlayerInterior(player1);
    LastVW[player1] = GetPlayerVirtualWorld(player1);
    LastInterior[player2] = GetPlayerInterior(player2);
    LastVW[player2] = GetPlayerVirtualWorld(player2);


    XeDuaP[player1] = CreateVehicle(522, -1393.9960,-217.5891,1050.6823,355.2848, 1, 1, -1);
    XeDuaP[player2] = CreateVehicle(522, -1402.5797,-218.2216,1050.6763,0.0586, 1, 1, -1);

    new engine,lights,alarm,doors,bonnet,boot,objective;
    GetVehicleParamsEx(XeDuaP[player1] ,engine,lights,alarm,doors,bonnet,boot,objective);
    SetVehicleParamsEx(XeDuaP[player1] ,VEHICLE_PARAMS_ON,lights,alarm,doors,bonnet,boot,objective);

    GetVehicleParamsEx(XeDuaP[player2] ,engine,lights,alarm,doors,bonnet,boot,objective);
    SetVehicleParamsEx(XeDuaP[player2] ,VEHICLE_PARAMS_ON,lights,alarm,doors,bonnet,boot,objective);

    SetPlayerPos(player1, -1393.9960,-217.5891,1050.6823);
    SetPlayerPos(player2, -1393.9960,-217.5891,1050.6823);
    SetPlayerInterior(player1, 7);
    SetPlayerInterior(player2, 7);

    SetVehicleVirtualWorld(XeDuaP[player1], player2 + player1);
    SetVehicleVirtualWorld(XeDuaP[player2], player2 + player1);
    LinkVehicleToInterior(XeDuaP[player1], 7);
    LinkVehicleToInterior(XeDuaP[player2], 7);
    SetPlayerVirtualWorld(player1, player2 + player1);
    SetPlayerVirtualWorld(player2, player2 + player1);
    PutPlayerInVehicle(player1, XeDuaP[player1], 0);
    PutPlayerInVehicle(player2, XeDuaP[player2], 0);

    DeletePVar(player1,"LoiMoiDuaXe");
    DeletePVar(player1,"NguoiMoiDuaXe");
    DeletePVar(player1,"OfferMoiDuaXe");
    DeletePVar(player2,"Dang_MoiDuaXe");
    DeletePVar(player2,"Dang_NguoiMoiDuaXe");
    DeletePVar(player2,"Dang_OfferMoiDuaXe");

    SetPVarInt(player1,"DangDuaXe",1);
    SetPVarInt(player1,"NguoiDuaXe",player2);
    SetPVarInt(player1,"GiaTien",giatien);

    SetPVarInt(player2,"DangDuaXe",1);
    SetPVarInt(player2,"NguoiDuaXe",player1);
    SetPVarInt(player2,"GiaTien",giatien);
    new string[129];
    format(string, 129, "[DUA XE] {f2ec62}%s{ffffff} da chap nhan loi moi dua xe cua ban", GetPlayerNameEx(player1));
    SendClientMessageEx(player2, -1, string);
    format(string, 129, "[DUA XE] Ban da chap nhan loi moi cua {f2ec62}%s", GetPlayerNameEx(player2));
    SendClientMessageEx(player1, -1, string);


    SetPVarInt(player1,"CPDuaXe",1);
    SetPVarInt(player2,"CPDuaXe",1);
    SetPlayerRaceCheckpoint(player1, 1, -1357.1676,-132.9526,1050.7109,-1263.7821,-220.9460,1050.3224, 5);
    SetPlayerRaceCheckpoint(player2, 1, -1357.1676,-132.9526,1050.7109,-1263.7821,-220.9460,1050.3224, 5);
    return 1;
}
hook OnPlayerEnterRaceCheckpoint(playerid) {
    if(GetPVarInt(playerid, "CPDuaXe") == 1 && IsPlayerInRangeOfPoint(playerid, 5, -1357.1676,-132.9526,1050.7109)) {
        DisablePlayerDynamicCheckPoint(playerid);
        SetPVarInt(playerid,"CPDuaXe",2);
        SetPlayerRaceCheckpoint(playerid, 1,-1263.7821,-220.9460,1050.3224,-1389.1334,-247.2982,1043.1143, 5);
    }
    if(GetPVarInt(playerid, "CPDuaXe") == 2 && IsPlayerInRangeOfPoint(playerid, 5, -1263.7821,-220.9460,1050.3224)) {
        DisablePlayerDynamicCheckPoint(playerid);
        SetPVarInt(playerid,"CPDuaXe",3);
        SetPlayerRaceCheckpoint(playerid, 1,-1389.1334,-247.2982,1043.1143,-1493.2635,-145.1177,1048.0848, 5);
    }
    if(GetPVarInt(playerid, "CPDuaXe") == 3 && IsPlayerInRangeOfPoint(playerid, 5, -1389.1334,-247.2982,1043.1143)) {
        DisablePlayerDynamicCheckPoint(playerid);
        SetPVarInt(playerid,"CPDuaXe",4);
        SetPlayerRaceCheckpoint(playerid, 1,-1493.2635,-145.1177,1048.0848,-1420.5447,-280.0449,1050.7844, 5);
    }
    if(GetPVarInt(playerid, "CPDuaXe") == 4 && IsPlayerInRangeOfPoint(playerid, 5, -1493.2635,-145.1177,1048.0848)) {
        DisablePlayerDynamicCheckPoint(playerid);
        SetPVarInt(playerid,"CPDuaXe",5);
        SetPlayerRaceCheckpoint(playerid, 1,-1420.5447,-280.0449,1050.7844,-1397.3110,-216.7099,1050.6927, 5);
    }
    if(GetPVarInt(playerid, "CPDuaXe") == 5 && IsPlayerInRangeOfPoint(playerid, 5, -1420.5447,-280.0449,1050.7844)) {
        DisablePlayerDynamicCheckPoint(playerid);
        SetPVarInt(playerid,"CPDuaXe",6);
        SetPlayerRaceCheckpoint(playerid, 1,-1397.3110,-216.7099,1050.6927,-1397.3110,-216.7099,1050.6927, 5);
    }


    if(GetPVarInt(playerid, "DangDuaXe") == 1 && GetPVarInt(playerid, "CPDuaXe") == 6 && IsPlayerInRangeOfPoint(playerid, 5, -1397.3110,-216.7099,1050.6927)) {
        new playerduaxe,string[129];
        format(string, sizeof string, "Chuc mung {f2ec62}%s{ffffff} da chien thang {f2ec62}%s{ffffff} trong cuoc dua xe ^^", GetPlayerNameEx(playerid),GetPlayerNameEx(playerduaxe));
        playerduaxe = GetPVarInt(playerid, "NguoiDuaXe");
        SendClientMessage(playerid,-1,"Ban da chien thang cuoc dua xe");
        SendClientMessage(playerduaxe,-1,"Ban da that bai trong cuoc dua xe");
        DisablePlayerRaceCheckpoint(playerid);
        SetTimerEx("FinishDuaXe", 5000, 0, "ii",playerid,playerduaxe );
        HienTextDraw(playerid,"Vui long doi 5s de tro ve vi tri cu...");
        TogglePlayerControllable(playerid, 0);
        TogglePlayerControllable(playerduaxe, 0);

    }
}
forward FinishDuaXe(playerid,playerduaxe);
public FinishDuaXe(playerid,playerduaxe) {
    SetPlayerPos(playerid, LastPostDX[playerid][0],LastPostDX[playerid][1],LastPostDX[playerid][2]);
    SetPlayerPos(playerduaxe, LastPostDX[playerduaxe][0],LastPostDX[playerduaxe][1],LastPostDX[playerduaxe][2]);
    SetPlayerInterior(playerid, LastInterior[playerid]);
    SetPlayerInterior(playerduaxe, LastInterior[playerduaxe]);
    SetPlayerVirtualWorld(playerid, LastVW[playerid]);
    SetPlayerVirtualWorld(playerduaxe, LastVW[playerduaxe]);

    PlayerInfo[playerid][pCash] +=  GetPVarInt(playerid, "GiaTien");
    PlayerInfo[playerduaxe][pCash] -=  GetPVarInt(playerduaxe, "GiaTien");
    DestroyVehicle(XeDuaP[playerid]);
    DestroyVehicle(XeDuaP[playerduaxe]);
    TogglePlayerControllable(playerduaxe, 1);
    TogglePlayerControllable(playerid, 1);
    DeletePVar(playerid,"DangDuaXe");
    DeletePVar(playerid,"NguoiDuaXe");
    DeletePVar(playerid,"GiaTien");
    DeletePVar(playerduaxe,"DangDuaXe");
    DeletePVar(playerduaxe,"NguoiDuaXe");
    DeletePVar(playerduaxe,"GiaTien");
    DeletePVar(playerduaxe, "CPDuaXe");
    DeletePVar(playerid, "CPDuaXe");
    return 1;
}
forward FinishDuaXeCrash(playerid,playerduaxe);
public FinishDuaXeCrash(playerid,playerduaxe) {
    SetPlayerPos(playerid, LastPostDX[playerid][0],LastPostDX[playerid][1],LastPostDX[playerid][2]);
    SetPlayerPos(playerduaxe, LastPostDX[playerduaxe][0],LastPostDX[playerduaxe][1],LastPostDX[playerduaxe][2]);
    SetPlayerInterior(playerid, LastInterior[playerid]);
    SetPlayerInterior(playerduaxe, LastInterior[playerduaxe]);
    SetPlayerVirtualWorld(playerid, LastVW[playerid]);
    SetPlayerVirtualWorld(playerduaxe, LastVW[playerduaxe]);


    DestroyVehicle(XeDuaP[playerid]);
    DestroyVehicle(XeDuaP[playerduaxe]);
    TogglePlayerControllable(playerduaxe, 1);
    TogglePlayerControllable(playerid, 1);
    DeletePVar(playerid,"DangDuaXe");
    DeletePVar(playerid,"NguoiDuaXe");
    DeletePVar(playerid,"GiaTien");
    DeletePVar(playerduaxe,"DangDuaXe");
    DeletePVar(playerduaxe,"NguoiDuaXe");
    DeletePVar(playerduaxe,"GiaTien");
    DeletePVar(playerduaxe, "CPDuaXe");
    DeletePVar(playerid, "CPDuaXe");
    return 1;
}
