copy hết code rồi để cuối gm ra f5 nữa là xong

CMD:moctui(playerid, params[])
{
    new string[128];
    if(GetPVarInt(playerid, "IsInArena") >= 0) {
        SendClientMessageEx(playerid,COLOR_GREY,"   Ban khong the lam dieu nay khi dang o dau truong!");
        return 1;
    }
    if(GetPVarInt( playerid, "EventToken") != 0)
 {
  SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the lam dieu nay khi dang trong event.");
  return 1;
 }
    if(WatchingTV[playerid] != 0) {
        SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the lam dieu nay khi dang xem TV!");
        return 1;
    }
    if (PlayerInfo[playerid][pJailTime] > 0) {
        SendClientMessageEx(playerid,COLOR_GREY,"   Khong the moc tui khi dang o tu!");
        return 1;
    }
    if(IsPlayerInAnyVehicle(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the lam dieu nay bay gio.");
    if(PlayerInfo[playerid][pHospital] == 1 || PlayerInfo[playerid][pHospital] == 2 || PlayerInfo[playerid][pHospital] == 3 || PlayerInfo[playerid][pHospital] == 4 || PlayerInfo[playerid][pHospital] == 5) {
        SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the che sung khi dang o Benh vien.");
        return 1;
    }
    if(playerid == giveplayerid)
 {
   SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the su dung lenh nay voi chinh minh");
    return 1;
  }
 if(PlayerInfo[playerid][pSexTime] > 1)
 {
     SendClientMessage(playerid, COLOR_GREY, "Moi lan moc tui phai cach nhau 2 phut!!");
  return 1;
    }
    new giveplayerid,x_moctui[20];
    if(sscanf(params, "us[20]", giveplayerid, x_moctui)) {
        SendClientMessageEx(playerid, COLOR_GREEN, "______________MOC TUI____________________");
        SendClientMessageEx(playerid, COLOR_GREY, "Su dung: /moctui [player] [tenvatpham]");
        SendClientMessageEx(playerid, COLOR_GREY, "Ten vat pham : Tien, Vatlieu, Pot, Crack ");
        return 1;
    }
    new ball = random(2);
 if(!IsPlayerConnected(giveplayerid)) {
  return SendClientMessageEx(playerid, COLOR_GRAD2, "Nguoi choi duoc chon khong hop le.");
 }
 if(IsPlayerInAnyVehicle(giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the moc tui nguoi do bay gio.");
 if(GetPVarInt(giveplayerid, "Injured") == 1) {
     return SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong the moc tui nguoi dang bi thuong.");
 }
    if (ProxDetectorS(2.0, playerid, giveplayerid)) {
    if(strcmp(x_moctui,"tien",true) == 0)
    {
     if(ball == 1)
   {
           if(PlayerInfo[giveplayerid][pCash] < 1000000)
           {
          SendClientMessageEx(playerid, COLOR_GRAD2, "Nguoi choi do khong con tien.");
          return 1;
           }
    new sotienmoc;
          sotienmoc = random(1000000);
          GivePlayerCash(playerid, sotienmoc);
          GivePlayerCash(giveplayerid, -sotienmoc);
          PlayerInfo[playerid][pSexTime] = 120;
       format(string, sizeof(string), "* %s da moc tui cua %s va lay duoc mot so tien.", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
          ProxDetector(15.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    format(string, sizeof(string), "* Ban da moc tui va lay duoc %d .",sotienmoc);
          SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
    format(string, sizeof(string), "* Ban da bi mat %d khi bi moc tui.",sotienmoc);
          SendClientMessageEx(giveplayerid, COLOR_GREY, string);
        }
        else
       {
       format(string, sizeof(string), "* %s da bi %s dam' vao` mat vi bi phat hien hanh vi moc tui.", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
          ProxDetector(15.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    format(string, sizeof(string), "* Ban da moc tui va that bai! Ban bi dam' vao` mom` va` mat' 10 mau' .");
          SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
    format(string, sizeof(string), "* Ban da danh ke trom phun mau' mui~ !");
          SendClientMessageEx(giveplayerid, COLOR_GREY, string);
       new Float:health;
       GetPlayerHealth(playerid, health);
       SetPlayerHealth(playerid, health-10);
       }
   }
   else if(strcmp(x_moctui,"vatlieu",true) == 0)
   {
       if(ball == 1)
    {
           if(PlayerInfo[giveplayerid][pMats] < 3000)
           {
          SendClientMessageEx(playerid, COLOR_GRAD2, "Nguoi choi do khong con vat lieu.");
          return 1;
           }
    new vatlieu;
          vatlieu = random(3000);
          PlayerInfo[playerid][pMats] += vatlieu;
          PlayerInfo[giveplayerid][pMats] -= vatlieu;
    PlayerInfo[playerid][pSexTime] = 120;
    format(string, sizeof(string), "* %s da moc tui cua %s va lay duoc mot so vat lieu.", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
          ProxDetector(15.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    format(string, sizeof(string), "* Ban da moc tui va lay duoc %d vat lieu .",vatlieu);
          SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
    format(string, sizeof(string), "* Ban da mat %d vat lieu vi bi nguoi khac moc tui.",vatlieu);
          SendClientMessageEx(giveplayerid, COLOR_GREY, string);
       }
       else
    {
       format(string, sizeof(string), "* %s da bi %s dam' vao` mat vi bi phat hien hanh vi moc tui.", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
          ProxDetector(15.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    format(string, sizeof(string), "* Ban da moc tui va that bai! Ban bi dam' vao` mom` va` mat' 10 mau' .");
          SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
    format(string, sizeof(string), "* Ban da danh ke trom phun mau' mui~ !");
          SendClientMessageEx(giveplayerid, COLOR_GREY, string);
          SetPlayerHealth(playerid, -10);
       new Float:health;
       GetPlayerHealth(playerid, health);
       SetPlayerHealth(playerid, health-10);
       }
    }
   else if(strcmp(x_moctui,"crack",true) == 0)
   {
       if(ball == 1)
    {
           if(PlayerInfo[giveplayerid][pCrack] < 300)
           {
          SendClientMessageEx(playerid, COLOR_GRAD2, "Nguoi choi do khong con vat lieu.");
          return 1;
           }
    new crack;
          crack = random(300);
          PlayerInfo[playerid][pCrack] += crack;
          PlayerInfo[giveplayerid][pCrack] -= crack;
    PlayerInfo[playerid][pSexTime] = 120;
    format(string, sizeof(string), "* %s da moc tui cua %s va lay duoc mot so vat lieu.", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
          ProxDetector(15.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    format(string, sizeof(string), "* Ban da moc tui va lay duoc %d vat lieu .",crack);
          SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
    format(string, sizeof(string), "* Ban da mat %d vat lieu vi bi nguoi khac moc tui.",crack);
          SendClientMessageEx(giveplayerid, COLOR_GREY, string);
       }
       else
    {
       format(string, sizeof(string), "* %s da bi %s dam' vao` mat vi bi phat hien hanh vi moc tui.", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
          ProxDetector(15.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    format(string, sizeof(string), "* Ban da moc tui va that bai! Ban bi dam' vao` mom` va` mat' 10 mau' .");
          SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
    format(string, sizeof(string), "* Ban da danh ke trom phun mau' mui~ !");
          SendClientMessageEx(giveplayerid, COLOR_GREY, string);
          SetPlayerHealth(playerid, -10);
       new Float:health;
       GetPlayerHealth(playerid, health);
       SetPlayerHealth(playerid, health-10);
       }
   }
   else if(strcmp(x_moctui,"pot",true) == 0)
   {
       if(ball == 1)
    {
           if(PlayerInfo[giveplayerid][pPot] < 300)
           {
          SendClientMessageEx(playerid, COLOR_GRAD2, "Nguoi choi do khong con vat lieu.");
          return 1;
           }
    new pot;
          pot = random(300);
          PlayerInfo[playerid][pPot] += pot;
          PlayerInfo[giveplayerid][pPot] -= pot;
    PlayerInfo[playerid][pSexTime] = 120;
    format(string, sizeof(string), "* %s da moc tui cua %s va lay duoc mot so vat lieu.", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
          ProxDetector(15.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    format(string, sizeof(string), "* Ban da moc tui va lay duoc %d vat lieu .",pot);
          SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
    format(string, sizeof(string), "* Ban da mat %d vat lieu vi bi nguoi khac moc tui.",pot);
          SendClientMessageEx(giveplayerid, COLOR_GREY, string);
       }
       else
    {
       format(string, sizeof(string), "* %s da bi %s dam' vao` mat vi bi phat hien hanh vi moc tui.", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
          ProxDetector(15.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    format(string, sizeof(string), "* Ban da moc tui va that bai! Ban bi dam' vao` mom` va` mat' 10 mau' .");
          SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
    format(string, sizeof(string), "* Ban da danh ke trom phun mau' mui~ !");
          SendClientMessageEx(giveplayerid, COLOR_GREY, string);
          SetPlayerHealth(playerid, -10);
       new Float:health;
       GetPlayerHealth(playerid, health);
       SetPlayerHealth(playerid, health-10);
       }
    }
    else
    {
 SendClientMessageEx(playerid,COLOR_GREY,"   Ten vat pham khong hop le!");
    return 1;
 }
    }
    else
 {
        SendClientMessageEx(playerid, COLOR_GREY, "Anh ta khong gan ban.");
        return 1;
    }
 return 1;
}