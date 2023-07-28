#include <a_samp>
#include <YSI\y_hooks>

#define             COLORDANHHIEU               (7017)

forward DanhHieu(playerid);
public DanhHieu(playerid)
{
    if(strcmp(PlayerInfo[playerid][pDanhHieu], "None", false))
		SetPlayerChatBubble(playerid, PlayerInfo[playerid][pDanhHieu], PlayerInfo[playerid][pColorDH] * 256 + 255, 30.0, 5000);
}

CMD:xemdanhhieu(playerid, params[])
{
	new string[1280];
    format(string, sizeof(string), "Danh hieu cua ban la {ff0000}%s{FFFFFF}.", PlayerInfo[playerid][pDanhHieu]);
	SendClientMessageEx(playerid, COLOR_YELLOW, string);
	return 1;
}

CMD:setdanhhieu(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 7)
	{
	    new string[128], giveplayerid, reason[64];
		if(sscanf(params, "us[64]", giveplayerid, reason)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /setdanhhieu [player] [danh hieu]");
		
		if(IsPlayerConnected(giveplayerid))
		{
		    strcpy(PlayerInfo[giveplayerid][pDanhHieu], reason, 128);
		    
            format(string, sizeof(string), "Ban da set danh hieu {ff0000}%s{FFFFFF} cho {ff00ff}%s{FFFFFF} thanh cong.", reason, GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
			
			format(string, sizeof(string), "Admin {ff00ff}%s{FFFFFF} da set danh hieu {ff0000}%s{FFFFFF} cho ban thanh cong.", GetPlayerNameEx(playerid), reason);
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
			return 1;
		}else SendClientMessageEx(playerid, COLOR_GRAD1, "Nguoi nay hien khong ton tai trong may chu.");
	}else SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	return 1;
}

new PlayerEditDH[MAX_PLAYERS];

CMD:setcolordh(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 7)
	{
	    new giveplayerid;
		if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /setcolordh [player]");
		PlayerEditDH[playerid] = -1;
		if(IsPlayerConnected(giveplayerid))
		{
		    if(strcmp(PlayerInfo[playerid][pDanhHieu], "None", false))
		    {
			    PlayerEditDH[playerid] = giveplayerid;
			    ShowPlayerDialog(playerid, COLORDANHHIEU, DIALOG_STYLE_INPUT, "MAU DANH HIEU","Ban vui long dien màu vao day : \n\nHuong dan :\n   + Ban co the len trang web (https://www.w3schools.com/colors/colors_picker.asp)\n   + Ban hay chon mau ma ban muon , VD : Mau Xanh La = 00ff00", "Dong y", "Huy bo");
			}else SendClientMessageEx(playerid, COLOR_GRAD1, "Nguoi nay hien chua duoc set danh hieu nao ca nen khong the chinh mau danh hieu.");
		}else SendClientMessageEx(playerid, COLOR_GRAD1, "Nguoi nay hien khong ton tai trong may chu.");
    }else SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	new string[5000];
	if(dialogid == COLORDANHHIEU)
	{
		if(response)
		{
		    new hColour;

		    new iLength = strlen(inputtext);
			if(!(2 <= iLength <= 6)) {
				ShowPlayerDialog(playerid, COLORDANHHIEU, DIALOG_STYLE_INPUT, "MAU DANH HIEU","Ban vui long dien màu vao day : \n\nHuong dan :\n   + Ban co the len trang web (https://www.w3schools.com/colors/colors_picker.asp)\n   + Ban hay chon mau ma ban muon , VD : Mau Xanh La = 00ff00", "Dong y", "Huy bo");
				return 1;
			}
			sscanf(inputtext, "h", hColour);
			PlayerInfo[PlayerEditDH[playerid]][pColorDH] = hColour;
			cmd_saveaccount(PlayerEditDH[playerid], "");
			format(string, sizeof(string), "Ban da doi mau danh hieu cho {00ff00}%s{FFFFFF} thanh {00ffff}%s{ffffff}", GetPlayerNameEx(PlayerEditDH[playerid]), inputtext);
			SendClientMessageEx(playerid, -1, string);
			PlayerEditDH[playerid] = -1;
		}
	}
	return 1;
}
