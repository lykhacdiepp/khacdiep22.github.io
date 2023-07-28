#define         CAUHOINEWB                  263
#define         TRALOICAUHOI                264

new CauHoiNewb[MAX_PLAYERS][1280];
new TraLoiCauHoi[MAX_PLAYERS][1280];

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == CAUHOINEWB)
	{
			if(response) {
			    new iLength = strlen(inputtext);
				if(!(2 <= iLength <= 200)) {
					ShowPlayerDialog(playerid, CAUHOINEWB, DIALOG_STYLE_INPUT, "{3399FF}Nhap cau hoi", "{FFFFFF}Cau hoi cua ban qua ngan hoac qua dai hay nhap lai.", "Dong y", "Bo qua");
					return 1;
				}
				new string[128];
				strcpy(CauHoiNewb[playerid], inputtext, 1280);
				format(string, sizeof(string), "** %s(%i) da gui mot cau hoi newb. (su dung /chapnhancauhoi %i)", GetPlayerNameEx(playerid), playerid, playerid);
				SendHelperMessage(TEAM_AZTECAS_COLOR, string);
				SetPVarInt( playerid, "CAUHOINEWB", 1 );
				SetPVarString(playerid, "CAUHOINEWBTEXT", CauHoiNewb[playerid]);
				SendClientMessageEx(playerid, COLOR_WHITE, "Ban da dat cau hoi thanh cong Hay doi Helper tra loi!");
				NewbieTimer[playerid] = gettime()+60;
			}
	}
	if(dialogid == TRALOICAUHOI)
	{
			if(response) {
			    //new iLength = strlen(inputtext);
			    new advert[256], stri[256], string1[256], reportid = GetPVarInt(playerid, "CAUHOINEWBID");
				GetPVarString(playerid, "TRALOICAUHOITEXT", advert, 1280);
				format(stri, sizeof(stri), "** [ID:%d] Newbie %s hoi: %s", reportid, GetPlayerNameEx(reportid), advert);
				format(string1, sizeof(string1), "** [ID:%d] Helper %s tra loi: %s", playerid, GetPlayerNameEx(playerid), inputtext);
				foreach(new n: Player)
				{
					if (gNewbie[n]==0)
					{
						SendClientMessageEx(n, COLOR_NEWBIE, stri);
						SendClientMessageEx(n, COLOR_NEWBIE, string1);
					}
				}
				DeletePVar(playerid, "CAUHOINEWBID");
				DeletePVar(playerid, "TRALOICAUHOITEXT");
			}
			else
			{
			new string3[128],reportid = GetPVarInt(playerid, "CAUHOINEWBID");
			format(string3, sizeof(string3), "* %s da tu choi cau hoi cua %s.",GetPlayerNameEx(playerid), GetPlayerNameEx(reportid));
			SendHelperMessage(TEAM_AZTECAS_COLOR, string3);
			DeletePVar(playerid, "CAUHOINEWBID");
			DeletePVar(playerid, "TRALOICAUHOITEXT");
			}
	}
	
CMD:chapnhancauhoi(playerid, params[])
{
    if(PlayerInfo[playerid][pHelper] != 1) {
        SendClientMessageEx(playerid, COLOR_GREY, "Ban khong phai la Helper.");
	}
	else {

		new Player, string[128];

		if(sscanf(params, "u", Player)) {
			SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /chapnhancauhoi [PlayerID]");
		}
		else if(Player == playerid) {
		    SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the tra loi cau hoi cua chinh minh.");
		}
		else if(!IsPlayerConnected(Player)) {
			SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi khong hop le.");
		}
		else if(GetPVarInt(Player, "CAUHOINEWB") == 0) {
			SendClientMessageEx(playerid, COLOR_GREY, "Nguoi do khong co cau hoi nao.");
		}
		else {
            new advert[256];
            GetPVarString(Player, "CAUHOINEWBTEXT", advert, 256);
            ShowPlayerDialog(playerid, TRALOICAUHOI, DIALOG_STYLE_INPUT, "Tra loi cau hoi", advert, "Tra Loi", "Tu choi");
            strcpy(TraLoiCauHoi[playerid], advert, 256);
            SetPVarString(playerid, "TRALOICAUHOITEXT", TraLoiCauHoi[playerid]);
            SetPVarInt(playerid, "CAUHOINEWBID", Player);
		    format(string, sizeof(string), "* %s da chap nhan cau hoi cua %s.",GetPlayerNameEx(playerid), GetPlayerNameEx(Player));
			SendHelperMessage(TEAM_AZTECAS_COLOR, string);
			format(string, sizeof(string), "* Helper %s da chap nhan cau hoi cua ban.",GetPlayerNameEx(playerid));
			SendClientMessageEx(Player, COLOR_LIGHTBLUE, string);
			DeletePVar(Player, "CAUHOINEWB");
			DeletePVar(Player, "CAUHOINEWBTEXT");
			ReportCount[playerid]++;
			ReportHourCount[playerid]++;
			AddCAReportToken(playerid);
			return 1;

		}
	}
	return 1;
}

CMD:xemcauhoi(playerid, params[])
{
	if(PlayerInfo[playerid][pHelper] >= 1 || PlayerInfo[playerid][pAdmin] >= 2)
	{
		new string[128];
		SendClientMessageEx(playerid, COLOR_GREEN, "____________________ YEU CAU TRA LOI _____________________");
		foreach(new i: Player)
		{
			if(GetPVarInt(i, "CAUHOINEWB"))
			{
				format(string, sizeof(string), "%s  | ID: %i dang co cau hoi chua duoc tra loi.", GetPlayerNameEx(i), i);
				SendClientMessageEx(playerid, COLOR_REPORT, string);
			}
		}
		SendClientMessageEx(playerid, COLOR_GREEN, "_________________________________________________________");
	}
	return 1;
}

CMD:newb(playerid, params[])
{
	if(gPlayerLogged{playerid} == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban chua dang nhap.");
	if(PlayerInfo[playerid][pTut] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the lam dieu nay bay gio.");
	if((nonewbie) && PlayerInfo[playerid][pAdmin] < 2) return SendClientMessageEx(playerid, COLOR_GRAD2, "Kenh hoi dap newbie dang tat!");
	if(PlayerInfo[playerid][pNMute] == 1) return SendClientMessageEx(playerid, COLOR_GREY, "Ban da bi cam noi chuyen tren kenh hoi dap.");
	if(gNewbie[playerid] == 1) return SendClientMessageEx(playerid, COLOR_GREY, "Ban da tat kenh hoi dap, /tognewbie de mo!");

	new string[128];
	if(gettime() < NewbieTimer[playerid])
	{
		format(string, sizeof(string), "Ban phai cho %d giay de tiep tuc hoi dap tren kenh nay.", NewbieTimer[playerid]-gettime());
		SendClientMessageEx(playerid, COLOR_GREY, string);
		return 1;
	}
	if(PlayerInfo[playerid][pHelper] >= 1 && PlayerInfo[playerid][pAdmin] < 2) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the su dung kenh nay!");
	if(PlayerInfo[playerid][pHelper] < 1 && PlayerInfo[playerid][pAdmin] < 1)
	{
		ShowPlayerDialog(playerid, CAUHOINEWB, DIALOG_STYLE_INPUT, "{3399FF}Nhap cau hoi", "{FFFFFF}Hay nhap cau hoi ma ban can hoi.", "Dong y", "Bo qua");
		return 1;
	}
	if(isnull(params)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: (/newb)ie [noi dung]");
	if(PlayerInfo[playerid][pAdmin] >= 2)
	{
	format(string, sizeof(string), "** Admin %s: %s", GetPlayerNameEx(playerid), params);
	}
	foreach(new n: Player)
	{
		if (gNewbie[n]==0)
		{
			SendClientMessageEx(n, COLOR_NEWBIE, string);
		}
	}
	return 1;
}
