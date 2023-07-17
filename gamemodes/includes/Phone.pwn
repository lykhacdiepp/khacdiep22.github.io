#include <a_samp>
#include <YSI\y_hooks>

#define                 DANHBA_1                (9100)
#define                 DANHBA_2                (9101)
#define                 DANHBA_3                (9102)
#define                 DANHBA_4                (9103)
#define                 DANHBA_5                (9104)
#define                 DANHBA_6                (9105)
#define                 DANHBA_7                (9106)
#define                 DANHBA_8                (9107)
#define                 DANHBA_9                (9108)

#define             	GOIDIEN_1               (9200)
#define             	NHANTIN_1               (9201)
#define             	EDITDB_1                (9202)
#define					EDITDB_1_1              (9203)

#define             	GOIDIEN_2               (9204)
#define             	NHANTIN_2               (9205)
#define             	EDITDB_2                (9206)
#define					EDITDB_2_2              (9207)

#define             	GOIDIEN_3               (9208)
#define             	NHANTIN_3               (9209)
#define             	EDITDB_3                (9210)
#define					EDITDB_3_3              (9211)

#define             	GOIDIEN_4               (9212)
#define             	NHANTIN_4               (9213)
#define             	EDITDB_4                (9214)
#define					EDITDB_4_4              (9215)

#define             	GOIDIEN_5               (9216)
#define             	NHANTIN_5               (9217)
#define             	EDITDB_5                (9218)
#define					EDITDB_5_5              (9219)

#define             	GOIDIEN_6               (9220)
#define             	NHANTIN_6               (9221)
#define             	EDITDB_6                (9222)
#define					EDITDB_6_6              (9223)

#define             	GOIDIEN_7               (9224)
#define             	NHANTIN_7               (9225)
#define             	EDITDB_7                (9226)
#define					EDITDB_7_7              (9227)

#define             	GOIDIEN_8               (9228)
#define             	NHANTIN_8               (9229)
#define             	EDITDB_8                (9230)
#define					EDITDB_8_8              (9231)

#define             	GOIDIEN_9               (9232)
#define             	NHANTIN_9               (9233)
#define             	EDITDB_9                (9234)
#define					EDITDB_9_9              (9235)

#define                 DIENTHOAI_MP3           (9300)

#define                 DIALOG_NDP_CHUYENTIEN   (9401)
#define 				DIALOG_CHUYENTIEN 		(9402)
#define 				DIALOG_CHUYENTIEN1 		(9403)
#define 				DIALOG_CHUYENTIEN2 		(9404)

#define					DIALOG_DIENTHOAI        (9000)
#define                 DIALOG_CALL             (9001)
#define                 DIALOG_DANHBA           (9002)

CMD:phone(playerid, params[]) {
    ShowDanhBa(playerid);
	return 1;
}

CMD:danhba(playerid, params[]) {
    ShowDanhBa(playerid);
	return 1;
}

stock ShowDanhBa(playerid) {
    new str[2460], str1[1280], str2[1280], str3[1280], str4[1280], str5[1280], str6[1280], str7[1280], str8[1280], str9[1280], name[1280];
	format(str1, sizeof(str), "1. TEN : %s || SDT : %d", PlayerInfo[playerid][pDanhBa1], PlayerInfo[playerid][pSDT1]);
    format(str2, sizeof(str), "2. TEN : %s || SDT : %d", PlayerInfo[playerid][pDanhBa2], PlayerInfo[playerid][pSDT2]);
    format(str3, sizeof(str), "3. TEN : %s || SDT : %d", PlayerInfo[playerid][pDanhBa3], PlayerInfo[playerid][pSDT3]);
    format(str4, sizeof(str), "4. TEN : %s || SDT : %d", PlayerInfo[playerid][pDanhBa4], PlayerInfo[playerid][pSDT4]);
    format(str5, sizeof(str), "5. TEN : %s || SDT : %d", PlayerInfo[playerid][pDanhBa5], PlayerInfo[playerid][pSDT5]);
    format(str6, sizeof(str), "6. TEN : %s || SDT : %d", PlayerInfo[playerid][pDanhBa6], PlayerInfo[playerid][pSDT6]);
    format(str7, sizeof(str), "7. TEN : %s || SDT : %d", PlayerInfo[playerid][pDanhBa7], PlayerInfo[playerid][pSDT7]);
    format(str8, sizeof(str), "8. TEN : %s || SDT : %d", PlayerInfo[playerid][pDanhBa8], PlayerInfo[playerid][pSDT8]);
    format(str9, sizeof(str), "9. TEN : %s || SDT : %d", PlayerInfo[playerid][pDanhBa9], PlayerInfo[playerid][pSDT9]);
    format(str, sizeof(str), "%s\n\n%s\n%s\n\n%s\n%s\n%s\n%s\n%s\n\n%s\n\n%s\n%s\n%s\n%s\n%s\n%s", str1,str2,str3,str4,str5,str6,str7,str8,str9);
    format(name, sizeof(name), "DANH BA CUA TOI");
	ShowPlayerDialog(playerid, DIALOG_DANHBA, DIALOG_STYLE_LIST, name, str, "Dong y", "Huy Bo");
	return 1;
}

/*stock SetSoTaiKhoan(playerid) {
    if(PlayerInfo[playerid][pPnumber] == 0)
    {
        if(PlayerInfo[playerid][pCash] > 5000){
            PlayerInfo[playerid][pCash] -= 5000;

            new sotaikhoan;
			sotaikhoan = 100000 + random(999999);
			PlayerInfo[playerid][pPnumber] = sotaikhoan;

			format(string, sizeof(string), "UPDATE accounts SET `PhoneNr`=%d WHERE `UserName` = '%e'", PlayerInfo[playerid][pPnumber], GetPlayerNameEx(playerid));
			mysql_function_query(MainPipeline, string, false, "OnQueryFinish", "ii", SENDDATA_THREAD, playerid);
			format(string,sizeof string,"Dang ky thanh cong the ngan hang\nSo tai khoan cua ban la: %d",sotaikhoan);
			ShowPlayerDialog(playerid, DIALOG_NOTHING,DIALOG_STYLE_MSGBOX,"Dang ky",string,"Dong y","");
        }else SendClientMessage(playerid, COLOR_YELLOW, "Ban khong du 5,000$ de mo tai khoan ngan hang!");
    }else SendClientMessage(playerid, COLOR_YELLOW, "Ban da kich hoat the ngan hang truoc do , khong the tiep tuc!");
    return 1;
}*/

stock ShowChuyenTien(playerid) {
    if(PlayerInfo[playerid][pPnumber] != 0){
        ShowPlayerDialog(playerid, DIALOG_NDP_CHUYENTIEN, DIALOG_STYLE_LIST, "Ban muon chuyen tien gi?", "Money\nKim cuong", "Tuy chon", "Thoat");
    }else SendClientMessage(playerid, COLOR_YELLOW, "Ban chua mo tai khoan thanh toan , vui long mo tai khoan thanh toan de su dung chuc nang nay!");
    return 1;
}

forward UpdateTK(playerid);
public UpdateTK(playerid) {
	new namez[24],bank;
	new rows = cache_num_rows();
	if(rows)
    {
        for(new i=0; i<rows; i++)
        {
    	    cache_get_field_content(i, "UserName", namez, MainPipeline, 24);
    	    bank = cache_get_field_content_int(i, "Bank", MainPipeline);
            bank += GetPVarInt(playerid, "TienGD");
		    new string[129];
		    format(string, sizeof(string), "UPDATE accounts SET `Bank`=%d WHERE `PhoneNr` = %d", bank, GetPVarInt(playerid, "STK"));
		    mysql_function_query(MainPipeline, string, false, "OnQueryFinish", "ii", SENDDATA_THREAD, playerid);
			return 1;
        }
    }
    else
    {
    	ShowPlayerDialog(playerid, DIALOG_CHUYENTIEN, DIALOG_STYLE_INPUT, "Chuyen tien", "So tai khoan khong ton tai !\nVui long nhap so tai khoan de tiep tuc giao dich", "Tuy chon", "Thoat");
    	return 1;
    }
    return 1;
}

forward UpdateTKKC(playerid);
public UpdateTKKC(playerid) {
	new namez[24],bank;
	new rows = cache_num_rows();
	if(rows)
    {
        for(new i=0; i<rows; i++)
        {
    	    cache_get_field_content(i, "UserName", namez, MainPipeline, 24);
    	    bank = cache_get_field_content_int(i, "nDP", MainPipeline);
            bank += GetPVarInt(playerid, "TienGD");
		    new string[129];
		    format(string, sizeof(string), "UPDATE accounts SET `nDP`=%d WHERE `PhoneNr` = %d", bank, GetPVarInt(playerid, "STK"));
		    mysql_function_query(MainPipeline, string, false, "OnQueryFinish", "ii", SENDDATA_THREAD, playerid);
			return 1;
        }
    }
    else
    {
    	ShowPlayerDialog(playerid, DIALOG_CHUYENTIEN, DIALOG_STYLE_INPUT, "Chuyen tien", "So tai khoan khong ton tai !\nVui long nhap so tai khoan de tiep tuc giao dich", "Tuy chon", "Thoat");
    	return 1;
    }
    return 1;
}

forward STK_check(playerid);
public STK_check(playerid) {
	new namez[24],stk;
	new rows = cache_num_rows();
    if(rows)
    {
        for(new i=0; i<rows; i++)
        {
    	    cache_get_field_content(i, "UserName",  namez, MainPipeline, 24);
    	    stk = cache_get_field_content_int(i, "SoTaiKhoan", MainPipeline);
            SetPVarString(playerid, "_NguoiNhan", namez);
		    SetPVarInt(playerid, "Offline", 1);
		    SetPVarInt(playerid, "STK", stk);
		    new string[129];
		    format(string, sizeof string, "Ten chu the\t\t\t\t%s\nSo tai khoan\t\t\t\t%d\nBan hay nhap so tien muon giao dich o ben duoi", namez,stk);
		    ShowPlayerDialog(playerid, DIALOG_CHUYENTIEN1, DIALOG_STYLE_INPUT, "Chuyen tien", string, "Tuy chon", "Thoat");
		    return 1;
        }
    }
    else {
 		ShowPlayerDialog(playerid, DIALOG_CHUYENTIEN, DIALOG_STYLE_INPUT, "Chuyen tien", "So tai khoan khong ton tai !\nVui long nhap so tai khoan de tiep tuc giao dich", "Tuy chon", "Thoat");
 		return 1;
    }
    return 1;
}

CMD:musicdienthoai(playerid, params[])
{
    ShowPlayerDialog(playerid, DIENTHOAI_MP3, DIALOG_STYLE_LIST, "Music dien thoai", "Sweet Street - M-TP\nNang Kieu Lo Buoc\nDe Vuong\nXuan Da Den Roi\nCuoi Thoi - Masew\nCo Chac Yeu La Day - MTP\nMuon Roi Ma Sao Con\nDi Ve Nha - DenVau\nThang Dien\nLoi Yeu Ngay Dai\n-> Link URL", "Nghe ngay", "Huy Bo");
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	new string[1280];
	if(dialogid == DIALOG_NDP_CHUYENTIEN && response == 1) {
	    if(listitem == 0) {
	        SetPVarInt(playerid, "nDPBankl", 1); // MONEY
        	ShowPlayerDialog(playerid, DIALOG_CHUYENTIEN, DIALOG_STYLE_INPUT, "Chuyen tien", "Vui long nhap so tai khoan de tiep tuc giao dich", "Tuy chon", "Thoat");
        }
        if(listitem == 1) {
        
        	ShowPlayerDialog(playerid, DIALOG_CHUYENTIEN, DIALOG_STYLE_INPUT, "Chuyen tien", "Vui long nhap so tai khoan de tiep tuc giao dich", "Tuy chon", "Thoat");
        	SetPVarInt(playerid, "nDPBankl", 2); // KIM CUONG
        }
	}

	if(dialogid == DIALOG_CHUYENTIEN)
    {
        if(response) {
    		if(!IsNumeric(inputtext) || strval(inputtext) < 123) return ShowPlayerDialog(playerid, DIALOG_CHUYENTIEN, DIALOG_STYLE_INPUT, "Chuyen tien", "Vui long nhap so tai khoan de tiep tuc giao dich", "Tuy chon", "Thoat");
			new check;
			if(strval(inputtext) == PlayerInfo[playerid][pPnumber]) return ShowPlayerDialog(playerid, DIALOG_CHUYENTIEN, DIALOG_STYLE_INPUT, "Chuyen tien", "Ban khong the chuyen tien cho minh\nVui long nhap so tai khoan de tiep tuc giao dich", "Tuy chon", "Thoat");
			foreach(new i: Player)
			{
				if(PlayerInfo[i][pPnumber] == strval(inputtext)) {
					SetPVarInt(playerid, "NguoiNhan", i);
					if(GetPVarInt(playerid, "nDPBankl") == 1) {
						format(string, sizeof string, "Ten chu the\t\t\t\t%s\nSo tai khoan\t\t\t\t%d\nBan hay nhap so tien muon giao dich o ben duoi", GetPlayerNameEx(i),strval(inputtext));
					}
				 	else {
						format(string, sizeof string, "Ten chu the\t\t\t\t%s\nSo tai khoan\t\t\t\t%d\nBan hay nhap so kim cuong muon giao dich o ben duoi", GetPlayerNameEx(i),strval(inputtext));
					}
					ShowPlayerDialog(playerid, DIALOG_CHUYENTIEN1, DIALOG_STYLE_INPUT, "Chuyen tien", string, "Tuy chon", "Thoat");
			   	    check = 1;
				}
			}
			if(check == 0) {
				format(string, sizeof(string), "SELECT `UserName`,`PhoneNr` from accounts WHERE PhoneNr = '%d'", strval(inputtext));
				mysql_tquery(MainPipeline, string, "STK_check", "d", playerid);
			}
		}
		else {
			DeletePVar(playerid,"Offline");
		}
	}

	if(dialogid == DIALOG_CHUYENTIEN2)
    {
        if(response) {
            new i = GetPVarInt(playerid, "NguoiNhan");
            new nguoinhan[24];
			GetPVarString(playerid,"_NguoiNhan",nguoinhan,24);
    		if(GetPVarInt(playerid, "Offline") == 1) {
    		    if(GetPVarInt(playerid, "nDPBankl") == 1) {
					format(string, sizeof(string), "SELECT `UserName`,`PhoneNr`,`Bank` from accounts WHERE PhoneNr = '%d'", GetPVarInt(playerid, "STK"));
					mysql_tquery(MainPipeline, string, "UpdateTK", "d", playerid);
				}
			 	else {
					format(string, sizeof(string), "SELECT `UserName`,`PhoneNr`,`nDP` from accounts WHERE PhoneNr = '%d'", GetPVarInt(playerid, "STK"));
					mysql_tquery(MainPipeline, string, "UpdateTKKC", "d", playerid);
				}
				
				new nguoinhan[24];
				GetPVarString(playerid,"_NguoiNhan",nguoinhan,24);
				DeletePVar(playerid,"Offline");
				if(GetPVarInt(playerid, "nDPBankl") == 1) {
					format(string, sizeof string, "[NGAN HANG] Ban da chuyen $%s vao tai khoan cua %s (STK: %d) ",number_format(GetPVarInt(playerid, "TienGD")),nguoinhan,GetPVarInt(playerid,"STK"));
	    		    SendClientMessage(playerid, COLOR_YELLOW2,string);
	    		    PlayerInfo[playerid][pAccount] -= GetPVarInt(playerid, "TienGD");
    				PlayerInfo[i][pAccount] += GetPVarInt(playerid, "TienGD");
    				format(string, sizeof string, "[NGAN HANG] %s (STK: %d) da chuyen $%s vao tai khoan ngan hang cua ban", GetPlayerNameEx(playerid),PlayerInfo[playerid][pPnumber],number_format(GetPVarInt(playerid, "TienGD")));
		    		SendClientMessage(i, COLOR_YELLOW2,string);

		    		format(string, sizeof string, "[NGAN HANG] Ban da chuyen $%s vao tai khoan cua %s (STK: %d) ",number_format(GetPVarInt(playerid, "TienGD")),GetPlayerNameEx(i),PlayerInfo[i][pPnumber]);
		    		SendClientMessage(playerid, COLOR_YELLOW2,string);
    		    }
    		    else {
					format(string, sizeof string, "[NGAN HANG] Ban da chuyen %sKC vao tai khoan cua %s (STK: %d) ",number_format(GetPVarInt(playerid, "TienGD")),nguoinhan,GetPVarInt(playerid,"STK"));
	    		    SendClientMessage(playerid, COLOR_YELLOW2,string);
	    		    PlayerInfo[playerid][pnDP] -= GetPVarInt(playerid, "TienGD");
    				PlayerInfo[i][pnDP] += GetPVarInt(playerid, "TienGD");
    				
    				format(string, sizeof string, "[NGAN HANG] %s (STK: %d) da chuyen %sKC vao tai khoan ngan hang cua ban", GetPlayerNameEx(playerid),PlayerInfo[playerid][pPnumber],number_format(GetPVarInt(playerid, "TienGD")));
		    		SendClientMessage(i, COLOR_YELLOW2,string);

		    		format(string, sizeof string, "[NGAN HANG] Ban da chuyen %sKC vao tai khoan cua %s (STK: %d) ",number_format(GetPVarInt(playerid, "TienGD")),GetPlayerNameEx(i),PlayerInfo[i][pPnumber]);
		    		SendClientMessage(playerid, COLOR_YELLOW2,string);
    		    }
				return 1;
    		}
    	}
	}

	if(dialogid == DIALOG_CHUYENTIEN1)
    {
        if(response) {
   			if(!IsNumeric(inputtext) || strval(inputtext) < 1 || strval(inputtext) > 1000000) return ShowPlayerDialog(playerid, DIALOG_CHUYENTIEN, DIALOG_STYLE_INPUT, "Chuyen tien", "Vui long nhap so tai khoan de tiep tuc giao dich", "Tuy chon", "Thoat");
			/*if(GetPVarInt(playerid, "nDPBankl") == 1)
			{
			    if(PlayerInfo[playerid][pAccount] < strval(inputtext)) {
			        SendClientMessageEx(playerid, COLOR_GREY,"Ban khong du tien trong vi khong the tiep tuc giao dich.");
			        return 1;
			    }
			}
            if(GetPVarInt(playerid, "nDPBankl") == 2)
			{
			    if(PlayerInfo[playerid][pnDP] < strval(inputtext)) {
			        SendClientMessageEx(playerid, COLOR_GREY,"Ban khong du KC trong vi khong the tiep tuc giao dich.");
			        return 1;
			    }
			}*/
			SetPVarInt(playerid, "TienGD", strval(inputtext));
			
            new namez[24];
			GetPVarString(playerid, "_NguoiNhan", namez, 24);
			if(GetPVarInt(playerid, "Offline") == 1) {
				if(GetPVarInt(playerid, "nDPBankl") == 1) {
					format(string, sizeof string, "Ten chu the\t\t\t\t%s\nSo tai khoan\t\t\t\t%d\nSo tien giao dich\t\t\t\t$%s\nPhi giao dich: $0\nSo tien du trong vi: %s",namez,GetPVarInt(playerid, "STK"),number_format(strval(inputtext)),number_format(PlayerInfo[playerid][pAccount]));
				}
				else {
					format(string, sizeof string, "Ten chu the\t\t\t\t%s\nSo tai khoan\t\t\t\t%d\nSo tien giao dich\t\t\t\t%sKC\nPhi giao dich: $0\nSo tien du trong vi: %s",namez,GetPVarInt(playerid, "STK"),number_format(strval(inputtext)),number_format(PlayerInfo[playerid][pAccount]));
				}
				ShowPlayerDialog(playerid, DIALOG_CHUYENTIEN2, DIALOG_STYLE_MSGBOX, "Xac nhan giao dich",string , "Xac nhan", "huy bo");
		   	 	return 1;
			}
			//new i = GetPVarInt(playerid, "NguoiNhan");
			if(GetPVarInt(playerid, "nDPBankl") == 1) {
				format(string, sizeof string, "Ten chu the\t\t\t\t%s\nSo tai khoan\t\t\t\t%d\nSo tien giao dich\t\t\t\t$%s\nPhi giao dich: $0\nSo tien du trong vi: %s",namez,GetPVarInt(playerid, "STK"),number_format(strval(inputtext)),number_format(PlayerInfo[playerid][pAccount]));
			}
			else {
				format(string, sizeof string, "Ten chu the\t\t\t\t%s\nSo tai khoan\t\t\t\t%d\nSo tien giao dich\t\t\t\t%sKC\nPhi giao dich: $0\nSo tien du trong vi: %s",namez,GetPVarInt(playerid, "STK"),number_format(strval(inputtext)),number_format(PlayerInfo[playerid][pAccount]));
			}
			ShowPlayerDialog(playerid, DIALOG_CHUYENTIEN2, DIALOG_STYLE_MSGBOX, "Xac nhan giao dich",string , "Xac nhan", "huy bo");
		}
		else {
			DeletePVar(playerid,"Offline");
		}
	}

	if(dialogid == DIENTHOAI_MP3)
    {
        if(response)
        {
            if(listitem == 0)
                PlayAudioStreamForPlayer(playerid, "https://uploadir.com/u/wis2ysgq");
            if(listitem == 1)
                PlayAudioStreamForPlayer(playerid, "https://uploadir.com/u/f4lq57i3");
            if(listitem == 2)
                PlayAudioStreamForPlayer(playerid, "https://uploadir.com/u/befym8hh");
            if(listitem == 3)
                PlayAudioStreamForPlayer(playerid, "https://uploadir.com/u/2qn8wxey");
            if(listitem == 4)
                PlayAudioStreamForPlayer(playerid, "https://uploadir.com/u/2tjmurjt");
            if(listitem == 5)
                PlayAudioStreamForPlayer(playerid, "https://uploadir.com/u/36qfxbnr");
            if(listitem == 6)
                PlayAudioStreamForPlayer(playerid, "https://uploadir.com/u/i97cw9xr");
            if(listitem == 7)
                PlayAudioStreamForPlayer(playerid, "https://uploadir.com/u/m3zh9tfe");
            if(listitem == 8)
                PlayAudioStreamForPlayer(playerid, "https://uploadir.com/u/6y5fi257");
            if(listitem == 9)
                PlayAudioStreamForPlayer(playerid, "https://uploadir.com/u/mg57x6u5");
            if(listitem == 10)// URL
                ShowPlayerDialog(playerid, STATIONSEARCH,DIALOG_STYLE_INPUT,"Tim kiem","Tim kiem vi du: vo+nguoi+ta","Tim kiem","Quay lai");
        }
	}

    if(dialogid == DIALOG_DIENTHOAI)
    {
        if(response)
        {
            if(listitem == 0)
            {
                ShowPlayerDialog(playerid, DIALOG_CALL, DIALOG_STYLE_INPUT, "Ban muon goi dien cho ai?", "Ban vui long dien so dien thoai ban can goi vao o ben duoi nay:", "Dong y", "");
            }
            if(listitem == 1)
            {
                ShowPlayerDialog(playerid, DIALOG_911MENU, DIALOG_STYLE_LIST, "Dich vu khan cap 911", "Khan cap\nBac si\nHo tro canh sat (Khong khan cap)\nKeo xe", "Lua chon", "Ket thuc cuoc goi");
            }
            if(listitem == 2)
            {
                if(GetPVarInt(playerid, "Injured") == 0)
				{
					SendClientMessageEx(playerid, COLOR_GREY, "   Ban khong bi thuong, ban khong the goi EMS!");
					return 1;
				}
				new zone[MAX_ZONE_NAME];
				GetPlayer2DZone(playerid, zone, MAX_ZONE_NAME);
				SetPVarInt(playerid, "EMSAttempt", 1);
				SendClientMessageEx(playerid, COLOR_WHITE, "EMS da  duoc thong bao ve vi tri hien tai cua ban va dang tren duong.");
				format(string, sizeof(string), "Cong Van khuan cap (%d) %s duoc nguoi bi thuong tai %s, Ho yeu cau van chuyen cap cuu ngay lam tuc.",playerid, GetPlayerNameEx(playerid), zone);
				SendGroupMessage(3, TEAM_MED_COLOR, string);
				PlayerInfo[playerid][pServiceTime] = gettime()+30;
            }
            if(listitem == 3)
            {
                if(Mechanics < 1)
				{
					SendClientMessageEx(playerid, COLOR_GREY, "   Khong co ai lam tho sua xe vao thoi diem nay, hay thu lai sau!");
					return 1;
				}
				format(string, sizeof(string), "** %s dang can mot tho sua xe - su dung /chapnhan suaxe de chap nhan cuoc goi.", GetPlayerNameEx(playerid));
				SendJobMessage(7, TEAM_AZTECAS_COLOR, string);
				SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Ban da keu mot tho sua xe, cho tra loi.");
				MechanicCall = playerid;
				PlayerInfo[playerid][pServiceTime] = gettime()+30;
            }
            if(listitem == 4)
            {
	            if(TaxiDrivers < 1) return SendClientMessageEx(playerid, COLOR_GREY, "   Cong ty taxi hien khong co ai dang duty lam nhiem vu thoi diem nay, hay thu lai sau!");
				if(TransportDuty[playerid] > 0) return SendClientMessageEx(playerid, COLOR_GREY, "   Ban khong the goi cho mot xe taxi vi khong co ai lam viec!");

				new szZoneName[MAX_ZONE_NAME];
				GetPlayer2DZone(playerid, szZoneName, MAX_ZONE_NAME);
				format(string, sizeof(string), "** %s(%d) dang can mot tai xe taxi tai %s - su dung /ataxi de chap nhan cuoc goi.", GetPlayerNameEx(playerid), playerid, szZoneName );
				SendTaxiMessage(TEAM_AZTECAS_COLOR, string);
				SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Ban da keu goi mot lai xe taxi, cho tra loi.");
				SetPVarInt(playerid, "TaxiCall", 1);
				PlayerInfo[playerid][pServiceTime] = gettime()+30;

            }
        }
	}
	if(dialogid == DIALOG_CALL && response == 1)
	{
    	if(strfind(inputtext, "%", true) != -1) {
			return 1;
		}
		if(strfind(inputtext, "c", true) != -1) {
			return 1;
		}

		new phonenumb = strval(inputtext);
		//___________________________________________________________________________________________________//
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
		if(PlayerInfo[playerid][pPnumber] == 0)
		{
			SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong co dien thoai.");
			return 1;
		}
		if(PhoneOnline[playerid] > 0)
		{
			SendClientMessageEx(playerid, COLOR_GREY, "Dien thoai cua ban dang tat.");
			return 1;
		}
		if(GetPVarType(playerid, "PlayerCuffed") || GetPVarType(playerid, "Injured") || GetPVarType(playerid, "IsFrozen")) {
	   		return SendClientMessage(playerid, COLOR_GRAD2, "Ban khong the lam dieu do vao luc nay!");
		}
		format(string, sizeof(string), "* %s lay dien thoai di dong tu tui quan ra.", GetPlayerNameEx(playerid));
		ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		if(phonenumb == 101)
		{
			return 1;
		}
		if(phonenumb == PlayerInfo[playerid][pPnumber])
		{
			SendClientMessageEx(playerid, COLOR_GRAD2, "  Dien thoai nguoi do dang ban...");
			return 1;
		}
		if(Mobile[playerid] != INVALID_PLAYER_ID)
		{
			SendClientMessageEx(playerid, COLOR_GRAD2, "  Ban dang co mot cuoc goi...");
			return 1;
		}

		foreach(new i: Player)
		{
			if(PlayerInfo[i][pPnumber] == phonenumb && phonenumb != 0)
			{
				new giveplayerid = i;
				Mobile[playerid] = giveplayerid; //caller connecting
				if(IsPlayerConnected(giveplayerid))
				{
					if(giveplayerid != INVALID_PLAYER_ID)
					{
						if(PhoneOnline[giveplayerid] > 0)
						{
							SendClientMessageEx(playerid, COLOR_GREY, "Dien thoai nguoi do dang tat.");
							Mobile[playerid] = INVALID_PLAYER_ID;
							return 1;
						}
						if(Mobile[giveplayerid] != INVALID_PLAYER_ID)
						{
							SendClientMessageEx(playerid, COLOR_GRAD2, "Dien thoai nguoi do dang ban...");
							Mobile[playerid] = INVALID_PLAYER_ID;
							return 1;
						}
						if(Spectating[giveplayerid]!=0)
						{
							SendClientMessageEx(playerid, COLOR_GRAD2, "Dien thoai nguoi do dang ban...");
							Mobile[playerid] = INVALID_PLAYER_ID;
							return 1;
						}
						if (Mobile[giveplayerid] == INVALID_PLAYER_ID)
						{
							format(string, sizeof(string), "Dien thoai di dong cua ban dang vang len - su dung /p de tra loi. [Nguoi goi ID: %s]", GetPlayerNameEx(playerid));
							SendClientMessageEx(giveplayerid, COLOR_YELLOW, string);
							RingTone[giveplayerid] = 10;
							format(string, sizeof(string), "* %s's dien thoai dang do chuong.", GetPlayerNameEx(i));
							SendClientMessageEx(playerid, COLOR_WHITE, "HINT: Bay gio ban co the bam T de tra loi cuoc goi, hoac /h de tat cuoc goi.");
							ProxDetector(30.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
							new Float:rX, Float:rY, Float:rZ;
							GetPlayerPos(giveplayerid, rX, rY, rZ);
							CellTime[playerid] = 1;
							SetPlayerAttachedObject(playerid, 9, 330, 6);
							return SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
						}
					}
				}
			}
		}
	}

	//________________________________________________________________________//
	if(dialogid == DIALOG_DANHBA)
    {
        if(response)
        {
            if(listitem == 0)
                ShowPlayerDialog(playerid, DANHBA_1, DIALOG_STYLE_LIST, "Danh ba dien thoai cua ban","Goi\nNhan tin\nSua\nXoa\nChuyen tien","Chon", "Dong");
            if(listitem == 1)
                ShowPlayerDialog(playerid, DANHBA_2, DIALOG_STYLE_LIST, "Danh ba dien thoai cua ban","Goi\nNhan tin\nSua\nXoa\nChuyen tien","Chon", "Dong");
            if(listitem == 2)
                ShowPlayerDialog(playerid, DANHBA_3, DIALOG_STYLE_LIST, "Danh ba dien thoai cua ban","Goi\nNhan tin\nSua\nXoa\nChuyen tien","Chon", "Dong");
            if(listitem == 3)
                ShowPlayerDialog(playerid, DANHBA_4, DIALOG_STYLE_LIST, "Danh ba dien thoai cua ban","Goi\nNhan tin\nSua\nXoa\nChuyen tien","Chon", "Dong");
            if(listitem == 4)
                ShowPlayerDialog(playerid, DANHBA_5, DIALOG_STYLE_LIST, "Danh ba dien thoai cua ban","Goi\nNhan tin\nSua\nXoa\nChuyen tien","Chon", "Dong");
            if(listitem == 5)
                ShowPlayerDialog(playerid, DANHBA_6, DIALOG_STYLE_LIST, "Danh ba dien thoai cua ban","Goi\nNhan tin\nSua\nXoa\nChuyen tien","Chon", "Dong");
            if(listitem == 6)
                ShowPlayerDialog(playerid, DANHBA_7, DIALOG_STYLE_LIST, "Danh ba dien thoai cua ban","Goi\nNhan tin\nSua\nXoa\nChuyen tien","Chon", "Dong");
            if(listitem == 7)
                ShowPlayerDialog(playerid, DANHBA_8, DIALOG_STYLE_LIST, "Danh ba dien thoai cua ban","Goi\nNhan tin\nSua\nXoa\nChuyen tien","Chon", "Dong");
            if(listitem == 8)
                ShowPlayerDialog(playerid, DANHBA_9, DIALOG_STYLE_LIST, "Danh ba dien thoai cua ban","Goi\nNhan tin\nSua\nXoa\nChuyen tien","Chon", "Dong");
        }
	}

	//________________________________________________________________________//
	if(dialogid == DANHBA_1)
    {
        if(response)
        {
            if(listitem == 0){ // GOI
				if(PlayerInfo[playerid][pSDT1] != 0){
				    new str[2460], str1[1280], str2[1280], str3[1280], str4[1280], name[1280];
					format(str1, sizeof(str), "THONG TIN CUOC GOI : ");
				    format(str2, sizeof(str), "    -> Ten nguoi nhan : %s", PlayerInfo[playerid][pDanhBa1]);
				    format(str3, sizeof(str), "    -> SDT : %d", PlayerInfo[playerid][pSDT1]);
				    format(str4, sizeof(str), "Neu ban muon goi dien cho nguoi nay, vui long nhan 'Goi ngay' de bat dau cuoc goi");
				    format(str, sizeof(str), "%s\n\n%s\n%s\n%s", str1,str2,str3,str4);
				    format(name, sizeof(name), "DIEN THOAI");
					ShowPlayerDialog(playerid, GOIDIEN_1, DIALOG_STYLE_MSGBOX, name, str, "Goi ngay", "Huy Bo");
					return 1;
				}else ShowPlayerDialog(playerid, DIALOG_NOTHING, DIALOG_STYLE_MSGBOX, "DIEN THOAI","Hien tai danh ba nay van dang con trong , ban vui long them nguoi than vao danh ba slot nay de goi dien...","Dong y", "");
            }
            if(listitem == 1){ // NHAN TIN
				if(PlayerInfo[playerid][pSDT1] != 0){
				    ShowPlayerDialog(playerid, NHANTIN_1, DIALOG_STYLE_INPUT, "Nhan tin", "Vui long nhap tin nhan", "Gui", "Huy");
				    return 1;
				}else ShowPlayerDialog(playerid, DIALOG_NOTHING, DIALOG_STYLE_MSGBOX, "DIEN THOAI","Hien tai danh ba nay van dang con trong , ban vui long them nguoi than vao danh ba slot nay de nhan tin...","Dong y", "");
            }
            if(listitem == 2){ // EDIT DANH BA
                ShowPlayerDialog(playerid, EDITDB_1, DIALOG_STYLE_INPUT, "Them/Sua so dien thoai", "Vui long dien ten hien thi", "Tiep Tuc", "Tro lai");
                return 1;
			}
			if(listitem == 3){ // XOA DANH BA
	            PlayerInfo[playerid][pSDT1] = 0;
	            format(PlayerInfo[playerid][pDanhBa1], 32, "None");
	            SendClientMessageEx(playerid, COLOR_YELLOW, "Ban da xoa danh ba thanh cong !.");
			}
			if(listitem == 4) { // SHOW CHUYEN TIEN
			    ShowChuyenTien(playerid);
			}
        }
	}

	if(dialogid == GOIDIEN_1)
    {
        if(response){
            new phonenumb = PlayerInfo[playerid][pSDT1];
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
			if(PlayerInfo[playerid][pPnumber] == 0)
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong co dien thoai.");
				return 1;
			}
			if(PhoneOnline[playerid] > 0)
			{
				SendClientMessageEx(playerid, COLOR_GREY, "Dien thoai cua ban dang tat.");
				return 1;
			}
			if(GetPVarType(playerid, "PlayerCuffed") || GetPVarType(playerid, "Injured") || GetPVarType(playerid, "IsFrozen")) {
		   		return SendClientMessage(playerid, COLOR_GRAD2, "Ban khong the lam dieu do vao luc nay!");
			}
			format(string, sizeof(string), "* %s lay dien thoai di dong tu tui quan ra.", GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			if(phonenumb == PlayerInfo[playerid][pPnumber])
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "  Dien thoai nguoi do dang ban...");
				return 1;
			}
			if(Mobile[playerid] != INVALID_PLAYER_ID)
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "  Ban dang co mot cuoc goi...");
				return 1;
			}

			foreach(new i: Player)
			{
				if(PlayerInfo[i][pPnumber] == phonenumb && phonenumb != 0)
				{
					new giveplayerid = i;
					Mobile[playerid] = giveplayerid; //caller connecting
					if(IsPlayerConnected(giveplayerid))
					{
						if(giveplayerid != INVALID_PLAYER_ID)
						{
							if(PhoneOnline[giveplayerid] > 0)
							{
								SendClientMessageEx(playerid, COLOR_GREY, "Dien thoai nguoi do dang tat.");
								Mobile[playerid] = INVALID_PLAYER_ID;
								return 1;
							}
							if(Mobile[giveplayerid] != INVALID_PLAYER_ID)
							{
								SendClientMessageEx(playerid, COLOR_GRAD2, "Dien thoai nguoi do dang ban...");
								Mobile[playerid] = INVALID_PLAYER_ID;
								return 1;
							}
							if(Spectating[giveplayerid]!=0)
							{
								SendClientMessageEx(playerid, COLOR_GRAD2, "Dien thoai nguoi do dang ban...");
								Mobile[playerid] = INVALID_PLAYER_ID;
								return 1;
							}
							if (Mobile[giveplayerid] == INVALID_PLAYER_ID)
							{
								format(string, sizeof(string), "Dien thoai di dong cua ban dang vang len - su dung /p de tra loi. [Nguoi goi ID: %s]", GetPlayerNameEx(playerid));
								SendClientMessageEx(giveplayerid, COLOR_YELLOW, string);
								RingTone[giveplayerid] = 10;
								format(string, sizeof(string), "* %s's dien thoai dang do chuong.", GetPlayerNameEx(i));
								SendClientMessageEx(playerid, COLOR_WHITE, "HINT: Bay gio ban co the bam T de tra loi cuoc goi, hoac /h de tat cuoc goi.");
								ProxDetector(30.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
								new Float:rX, Float:rY, Float:rZ;
								GetPlayerPos(giveplayerid, rX, rY, rZ);
								CellTime[playerid] = 1;
								SetPlayerAttachedObject(playerid, 9, 330, 6);
								return SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
							}
						}
					}
				}
			}
        }
    }

    if(dialogid == NHANTIN_1)
    {
       if(response)
       {
			new phonenumb = PlayerInfo[playerid][pSDT1];
    	    if(Spectating[playerid] == 0)
			{
				format(string, sizeof(string), "* %s lay dien thoai di dong tu trong tui quan.", GetPlayerNameEx(playerid));
				ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			}
			if(phonenumb == 555)
			{
				if ((strcmp("yes", inputtext, true, strlen(inputtext)) == 0) && (strlen(inputtext) == strlen("yes")))
				{
					SendClientMessageEx(playerid, COLOR_WHITE, "Tin nhan van ban.");
					SendClientMessageEx(playerid, COLOR_YELLOW, "SMS: Toi dang theo doi ban, Sender: MOLE (555)");
					RingTone[playerid] = 20;
					return 1;
				}
				else
				{
					SendClientMessageEx(playerid, COLOR_YELLOW, "SMS: Toi dang theo doi ban, Sender: MOLE (555)");
					RingTone[playerid] = 20;
					return 1;
				}
			}
			foreach(new i: Player)
			{
				if(PlayerInfo[i][pPnumber] == phonenumb && phonenumb != 0)
				{
					new giveplayerid = i;
					if(Mobile[giveplayerid] != INVALID_PLAYER_ID)
					{
						SendClientMessageEx(playerid, COLOR_GREY, "Dien thoai cua nguoi do dang ban.");
						return 1;
					}
					Mobile[playerid] = giveplayerid; //caller connecting
					if(IsPlayerConnected(giveplayerid))
					{
						if(giveplayerid != INVALID_PLAYER_ID)
						{

							if(PhoneOnline[giveplayerid] > 0)
							{
								SendClientMessageEx(playerid, COLOR_GREY, "Dien thoai cua nguoi do dang tat.");
								Mobile[playerid] = INVALID_PLAYER_ID;
								return 1;
							}
							foreach(new u: Player)
				    		{
				        		if(GetPVarInt(u, "BigEar") == 6 && (GetPVarInt(u, "BigEarPlayer") == playerid || GetPVarInt(u, "BigEarPlayer") == giveplayerid))
				        		{
		       						format(string, sizeof(string), "(BE) %s SMS cho %s: %s", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid), inputtext);
									SendClientMessageEx(u,COLOR_YELLOW, string);
								}
							}
							if(PlayerInfo[playerid][pPhonePrivacy] == 1)
							{
								format(string, sizeof(string), "SMS: %s, Nguoi gui: Khong biet.", inputtext, GetPlayerNameEx(playerid));
							}
							else
							{
								format(string, sizeof(string), "SMS: %s, Nguoi gui: %s (%d)", inputtext, GetPlayerNameEx(playerid), PlayerInfo[playerid][pPnumber]);
							}

							if(i != playerid)
							{
								if(PlayerInfo[i][pSmslog] > 0)
								{
									new query[384], ftext[128];
									mysql_escape_string(inputtext, ftext);
									if(PlayerInfo[playerid][pPhonePrivacy] == 1) format(query, sizeof(query), "INSERT INTO `sms` (`id`, `sender`, `senderid`, `sendernumber`, `receiver`, `receiverid`, `receivernumber`, `message`, `date`) VALUES (NULL, '%s', %d, 0, '%s', %d, %d, '%s', NOW())", GetPlayerNameExt(playerid), GetPlayerSQLId(playerid), GetPlayerNameExt(i), GetPlayerSQLId(i), phonenumb, ftext);
									else format(query, sizeof(query), "INSERT INTO `sms` (`id`, `sender`, `senderid`, `sendernumber`, `receiver`, `receiverid`, `receivernumber`, `message`, `date`) VALUES (NULL, '%s', %d, %d, '%s', %d, %d, '%s', NOW())", GetPlayerNameExt(playerid), GetPlayerSQLId(playerid), PlayerInfo[playerid][pPnumber], GetPlayerNameExt(i), GetPlayerSQLId(i), phonenumb, ftext);
									mysql_function_query(MainPipeline, query, false, "OnQueryFinish", "i", SENDDATA_THREAD);
								}
							}

							RingTone[giveplayerid] =20;
							SendClientMessageEx(giveplayerid, COLOR_YELLOW, string);
							SendClientMessageEx(playerid, COLOR_YELLOW, string);
							SendClientMessageEx(playerid, COLOR_WHITE, "Gui tin nhan van ban");
							
							Mobile[playerid] = INVALID_PLAYER_ID;

							if(strcmp(PlayerInfo[giveplayerid][pAutoTextReply], "Nothing", true) != 0)
							{
								format(string, sizeof(string), "SMS: %s, Nguoi gui: %s [automated response] (%d)", PlayerInfo[giveplayerid][pAutoTextReply], GetPlayerNameEx(giveplayerid), PlayerInfo[giveplayerid][pPnumber]);
								SendClientMessageEx(playerid, COLOR_YELLOW, string);
							}

							return 1;
						}
					}
				}
			}
			SendClientMessageEx(playerid, COLOR_GRAD2, "  Gui tin nhan that bai...");
       }
    }

    if(dialogid == EDITDB_1)
    {
        if(response)
		{
			strmid(PlayerInfo[playerid][pDanhBa1], inputtext, 0, strlen(inputtext), 128);
			format(string, sizeof(string), "UPDATE `accounts` SET `DanhBa1`='%s' WHERE `id`=%d", inputtext, GetPlayerSQLId(playerid));
			mysql_function_query(MainPipeline, string, false, "OnQueryFinish", "i", SENDDATA_THREAD);
			ShowPlayerDialog(playerid, EDITDB_1_1, DIALOG_STYLE_INPUT, "Them/Sua so dien thoai", "Vui long dien so dien thoai", "Tiep Tuc", "Tro lai");
        }
	}

	if(dialogid == EDITDB_1_1)
    {
		if(response)
		{
			new sdtdanhba = strval(inputtext);

			if(~strfind(inputtext, ";") || ~strfind(inputtext, ",") || ~strfind(inputtext, "'") || ~strfind(inputtext, ":") ||
			~strfind(inputtext, "|") || ~strfind(inputtext, "{") || ~strfind(inputtext, "}") || ~strfind(inputtext, "+") ||
			~strfind(inputtext, "?") || ~strfind(inputtext, "/")  || ~strfind(inputtext, " ") ||
			~strfind(inputtext, "@") || ~strfind(inputtext, "[") || ~strfind(inputtext, "]") || ~strfind(inputtext, "<") ||
			~strfind(inputtext, ">") || ~strfind(inputtext, "!") || ~strfind(inputtext, "#") || ~strfind(inputtext, "^") ||
			~strfind(inputtext, "*") || ~strfind(inputtext, "&") || ~strfind(inputtext, "q") || ~strfind(inputtext, "w") ||
			~strfind(inputtext, "e") || ~strfind(inputtext, "r") || ~strfind(inputtext, "t") || ~strfind(inputtext, "y") ||
			~strfind(inputtext, "u") || ~strfind(inputtext, "i") || ~strfind(inputtext, "o") || ~strfind(inputtext, "p") ||
			~strfind(inputtext, "a") || ~strfind(inputtext, "s") || ~strfind(inputtext, "d") || ~strfind(inputtext, "f") ||
			~strfind(inputtext, "g") || ~strfind(inputtext, "h") || ~strfind(inputtext, "j") || ~strfind(inputtext, "k") ||
			~strfind(inputtext, "l") || ~strfind(inputtext, "z") || ~strfind(inputtext, "x") || ~strfind(inputtext, "c") ||
			~strfind(inputtext, "v") || ~strfind(inputtext, "b") || ~strfind(inputtext, "n") || ~strfind(inputtext, "m") ||
			~strfind(inputtext, "(") || ~strfind(inputtext, ")") || ~strfind(inputtext, ".") || ~strfind(inputtext, "%")) return ShowPlayerDialog(playerid, EDITDB_1_1, DIALOG_STYLE_INPUT,"{ff0000}[!]","{ff0000}Vui long nhap so dien thoai bang so.","Chap nhan","Thoat");

			PlayerInfo[playerid][pSDT1] = sdtdanhba;

			format(string, sizeof(string), "UPDATE `accounts` SET `SDT1`=%d WHERE `id` = %d",number_format(sdtdanhba), GetPlayerSQLId(playerid));
			mysql_function_query(MainPipeline, string, false, "OnQueryFinish", "ii", SENDDATA_THREAD, playerid);

			format(string, sizeof(string), "Ban da them thanh cong so dien thoai %d duoi ten %s.",PlayerInfo[playerid][pSDT1], PlayerInfo[playerid][pDanhBa1]);
			SendClientMessageEx(playerid, COLOR_YELLOW, string);
		}
    }

    //________________________________________________________________________//
	if(dialogid == DANHBA_2)
    {
        if(response)
        {
            if(listitem == 0){ // GOI
				if(PlayerInfo[playerid][pSDT2] != 0){
				    new str[2460], str1[1280], str2[1280], str3[1280], str4[1280], name[1280];
					format(str1, sizeof(str), "THONG TIN CUOC GOI : ");
				    format(str2, sizeof(str), "    -> Ten nguoi nhan : %s", PlayerInfo[playerid][pDanhBa2]);
				    format(str3, sizeof(str), "    -> SDT : %d", PlayerInfo[playerid][pSDT2]);
				    format(str4, sizeof(str), "Neu ban muon goi dien cho nguoi nay, vui long nhan 'Goi ngay' de bat dau cuoc goi");
				    format(str, sizeof(str), "%s\n\n%s\n%s\n%s", str1,str2,str3,str4);
				    format(name, sizeof(name), "DIEN THOAI");
					ShowPlayerDialog(playerid, GOIDIEN_2, DIALOG_STYLE_MSGBOX, name, str, "Goi ngay", "Huy Bo");
					return 1;
				}else ShowPlayerDialog(playerid, DIALOG_NOTHING, DIALOG_STYLE_MSGBOX, "DIEN THOAI","Hien tai danh ba nay van dang con trong , ban vui long them nguoi than vao danh ba slot nay de goi dien...","Dong y", "");
            }
            if(listitem == 1){ // NHAN TIN
				if(PlayerInfo[playerid][pSDT2] != 0){
				    ShowPlayerDialog(playerid, NHANTIN_2, DIALOG_STYLE_INPUT, "Nhan tin", "Vui long nhap tin nhan", "Gui", "Huy");
				    return 1;
				}else ShowPlayerDialog(playerid, DIALOG_NOTHING, DIALOG_STYLE_MSGBOX, "DIEN THOAI","Hien tai danh ba nay van dang con trong , ban vui long them nguoi than vao danh ba slot nay de nhan tin...","Dong y", "");
            }
            if(listitem == 2){ // EDIT DANH BA
                ShowPlayerDialog(playerid, EDITDB_2, DIALOG_STYLE_INPUT, "Them/Sua so dien thoai", "Vui long dien ten hien thi", "Tiep Tuc", "Tro lai");
                return 1;
			}
			if(listitem == 3){ // XOA DANH BA
	            PlayerInfo[playerid][pSDT2] = 0;
	            format(PlayerInfo[playerid][pDanhBa2], 32, "None");
	            SendClientMessageEx(playerid, COLOR_YELLOW, "Ban da xoa danh ba thanh cong !.");
			}
			if(listitem == 4) { // SHOW CHUYEN TIEN
			    ShowChuyenTien(playerid);
			}
        }
	}

	if(dialogid == GOIDIEN_2)
    {
        if(response){
            new phonenumb = PlayerInfo[playerid][pSDT2];
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
			if(PlayerInfo[playerid][pPnumber] == 0)
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong co dien thoai.");
				return 1;
			}
			if(PhoneOnline[playerid] > 0)
			{
				SendClientMessageEx(playerid, COLOR_GREY, "Dien thoai cua ban dang tat.");
				return 1;
			}
			if(GetPVarType(playerid, "PlayerCuffed") || GetPVarType(playerid, "Injured") || GetPVarType(playerid, "IsFrozen")) {
		   		return SendClientMessage(playerid, COLOR_GRAD2, "Ban khong the lam dieu do vao luc nay!");
			}
			format(string, sizeof(string), "* %s lay dien thoai di dong tu tui quan ra.", GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			if(phonenumb == PlayerInfo[playerid][pPnumber])
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "  Dien thoai nguoi do dang ban...");
				return 1;
			}
			if(Mobile[playerid] != INVALID_PLAYER_ID)
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "  Ban dang co mot cuoc goi...");
				return 1;
			}

			foreach(new i: Player)
			{
				if(PlayerInfo[i][pPnumber] == phonenumb && phonenumb != 0)
				{
					new giveplayerid = i;
					Mobile[playerid] = giveplayerid; //caller connecting
					if(IsPlayerConnected(giveplayerid))
					{
						if(giveplayerid != INVALID_PLAYER_ID)
						{
							if(PhoneOnline[giveplayerid] > 0)
							{
								SendClientMessageEx(playerid, COLOR_GREY, "Dien thoai nguoi do dang tat.");
								Mobile[playerid] = INVALID_PLAYER_ID;
								return 1;
							}
							if(Mobile[giveplayerid] != INVALID_PLAYER_ID)
							{
								SendClientMessageEx(playerid, COLOR_GRAD2, "Dien thoai nguoi do dang ban...");
								Mobile[playerid] = INVALID_PLAYER_ID;
								return 1;
							}
							if(Spectating[giveplayerid]!=0)
							{
								SendClientMessageEx(playerid, COLOR_GRAD2, "Dien thoai nguoi do dang ban...");
								Mobile[playerid] = INVALID_PLAYER_ID;
								return 1;
							}
							if (Mobile[giveplayerid] == INVALID_PLAYER_ID)
							{
								format(string, sizeof(string), "Dien thoai di dong cua ban dang vang len - su dung /p de tra loi. [Nguoi goi ID: %s]", GetPlayerNameEx(playerid));
								SendClientMessageEx(giveplayerid, COLOR_YELLOW, string);
								RingTone[giveplayerid] = 10;
								format(string, sizeof(string), "* %s's dien thoai dang do chuong.", GetPlayerNameEx(i));
								SendClientMessageEx(playerid, COLOR_WHITE, "HINT: Bay gio ban co the bam T de tra loi cuoc goi, hoac /h de tat cuoc goi.");
								ProxDetector(30.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
								new Float:rX, Float:rY, Float:rZ;
								GetPlayerPos(giveplayerid, rX, rY, rZ);
								CellTime[playerid] = 1;
								SetPlayerAttachedObject(playerid, 9, 330, 6);
								return SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
							}
						}
					}
				}
			}
        }
    }

    if(dialogid == NHANTIN_2)
    {
       if(response)
       {
			new phonenumb = PlayerInfo[playerid][pSDT2];
    	    if(Spectating[playerid] == 0)
			{
				format(string, sizeof(string), "* %s lay dien thoai di dong tu trong tui quan.", GetPlayerNameEx(playerid));
				ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			}
			if(phonenumb == 555)
			{
				if ((strcmp("yes", inputtext, true, strlen(inputtext)) == 0) && (strlen(inputtext) == strlen("yes")))
				{
					SendClientMessageEx(playerid, COLOR_WHITE, "Tin nhan van ban.");
					SendClientMessageEx(playerid, COLOR_YELLOW, "SMS: Toi dang theo doi ban, Sender: MOLE (555)");
					RingTone[playerid] = 20;
					return 1;
				}
				else
				{
					SendClientMessageEx(playerid, COLOR_YELLOW, "SMS: Toi dang theo doi ban, Sender: MOLE (555)");
					RingTone[playerid] = 20;
					return 1;
				}
			}
			foreach(new i: Player)
			{
				if(PlayerInfo[i][pPnumber] == phonenumb && phonenumb != 0)
				{
					new giveplayerid = i;
					if(Mobile[giveplayerid] != INVALID_PLAYER_ID)
					{
						SendClientMessageEx(playerid, COLOR_GREY, "Dien thoai cua nguoi do dang ban.");
						return 1;
					}
					Mobile[playerid] = giveplayerid; //caller connecting
					if(IsPlayerConnected(giveplayerid))
					{
						if(giveplayerid != INVALID_PLAYER_ID)
						{

							if(PhoneOnline[giveplayerid] > 0)
							{
								SendClientMessageEx(playerid, COLOR_GREY, "Dien thoai cua nguoi do dang tat.");
								Mobile[playerid] = INVALID_PLAYER_ID;
								return 1;
							}
							foreach(new u: Player)
				    		{
				        		if(GetPVarInt(u, "BigEar") == 6 && (GetPVarInt(u, "BigEarPlayer") == playerid || GetPVarInt(u, "BigEarPlayer") == giveplayerid))
				        		{
		       						format(string, sizeof(string), "(BE) %s SMS cho %s: %s", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid), inputtext);
									SendClientMessageEx(u,COLOR_YELLOW, string);
								}
							}
							if(PlayerInfo[playerid][pPhonePrivacy] == 1)
							{
								format(string, sizeof(string), "SMS: %s, Nguoi gui: Khong biet.", inputtext, GetPlayerNameEx(playerid));
							}
							else
							{
								format(string, sizeof(string), "SMS: %s, Nguoi gui: %s (%d)", inputtext, GetPlayerNameEx(playerid), PlayerInfo[playerid][pPnumber]);
							}

							if(i != playerid)
							{
								if(PlayerInfo[i][pSmslog] > 0)
								{
									new query[384], ftext[128];
									mysql_escape_string(inputtext, ftext);
									if(PlayerInfo[playerid][pPhonePrivacy] == 1) format(query, sizeof(query), "INSERT INTO `sms` (`id`, `sender`, `senderid`, `sendernumber`, `receiver`, `receiverid`, `receivernumber`, `message`, `date`) VALUES (NULL, '%s', %d, 0, '%s', %d, %d, '%s', NOW())", GetPlayerNameExt(playerid), GetPlayerSQLId(playerid), GetPlayerNameExt(i), GetPlayerSQLId(i), phonenumb, ftext);
									else format(query, sizeof(query), "INSERT INTO `sms` (`id`, `sender`, `senderid`, `sendernumber`, `receiver`, `receiverid`, `receivernumber`, `message`, `date`) VALUES (NULL, '%s', %d, %d, '%s', %d, %d, '%s', NOW())", GetPlayerNameExt(playerid), GetPlayerSQLId(playerid), PlayerInfo[playerid][pPnumber], GetPlayerNameExt(i), GetPlayerSQLId(i), phonenumb, ftext);
									mysql_function_query(MainPipeline, query, false, "OnQueryFinish", "i", SENDDATA_THREAD);
								}
							}

							RingTone[giveplayerid] =20;
							SendClientMessageEx(giveplayerid, COLOR_YELLOW, string);
							SendClientMessageEx(playerid, COLOR_YELLOW, string);
							SendClientMessageEx(playerid, COLOR_WHITE, "Gui tin nhan van ban");
							
							Mobile[playerid] = INVALID_PLAYER_ID;

							if(strcmp(PlayerInfo[giveplayerid][pAutoTextReply], "Nothing", true) != 0)
							{
								format(string, sizeof(string), "SMS: %s, Nguoi gui: %s [automated response] (%d)", PlayerInfo[giveplayerid][pAutoTextReply], GetPlayerNameEx(giveplayerid), PlayerInfo[giveplayerid][pPnumber]);
								SendClientMessageEx(playerid, COLOR_YELLOW, string);
							}

							return 1;
						}
					}
				}
			}
			SendClientMessageEx(playerid, COLOR_GRAD2, "  Gui tin nhan that bai...");
       }
    }

    if(dialogid == EDITDB_2)
    {
        if(response)
		{
			strmid(PlayerInfo[playerid][pDanhBa2], inputtext, 0, strlen(inputtext), 128);
			format(string, sizeof(string), "UPDATE `accounts` SET `DanhBa2`='%s' WHERE `id`=%d", inputtext, GetPlayerSQLId(playerid));
			mysql_function_query(MainPipeline, string, false, "OnQueryFinish", "i", SENDDATA_THREAD);
			ShowPlayerDialog(playerid, EDITDB_2_2, DIALOG_STYLE_INPUT, "Them/Sua so dien thoai", "Vui long dien so dien thoai", "Tiep Tuc", "Tro lai");
        }
	}

	if(dialogid == EDITDB_2_2)
    {
		if(response)
		{
			new sdtdanhba = strval(inputtext);

			if(~strfind(inputtext, ";") || ~strfind(inputtext, ",") || ~strfind(inputtext, "'") || ~strfind(inputtext, ":") ||
			~strfind(inputtext, "|") || ~strfind(inputtext, "{") || ~strfind(inputtext, "}") || ~strfind(inputtext, "+") ||
			~strfind(inputtext, "?") || ~strfind(inputtext, "/")  || ~strfind(inputtext, " ") ||
			~strfind(inputtext, "@") || ~strfind(inputtext, "[") || ~strfind(inputtext, "]") || ~strfind(inputtext, "<") ||
			~strfind(inputtext, ">") || ~strfind(inputtext, "!") || ~strfind(inputtext, "#") || ~strfind(inputtext, "^") ||
			~strfind(inputtext, "*") || ~strfind(inputtext, "&") || ~strfind(inputtext, "q") || ~strfind(inputtext, "w") ||
			~strfind(inputtext, "e") || ~strfind(inputtext, "r") || ~strfind(inputtext, "t") || ~strfind(inputtext, "y") ||
			~strfind(inputtext, "u") || ~strfind(inputtext, "i") || ~strfind(inputtext, "o") || ~strfind(inputtext, "p") ||
			~strfind(inputtext, "a") || ~strfind(inputtext, "s") || ~strfind(inputtext, "d") || ~strfind(inputtext, "f") ||
			~strfind(inputtext, "g") || ~strfind(inputtext, "h") || ~strfind(inputtext, "j") || ~strfind(inputtext, "k") ||
			~strfind(inputtext, "l") || ~strfind(inputtext, "z") || ~strfind(inputtext, "x") || ~strfind(inputtext, "c") ||
			~strfind(inputtext, "v") || ~strfind(inputtext, "b") || ~strfind(inputtext, "n") || ~strfind(inputtext, "m") ||
			~strfind(inputtext, "(") || ~strfind(inputtext, ")") || ~strfind(inputtext, ".") || ~strfind(inputtext, "%")) return ShowPlayerDialog(playerid, EDITDB_2_2, DIALOG_STYLE_INPUT,"{ff0000}[!]","{ff0000}Vui long nhap so dien thoai bang so.","Chap nhan","Thoat");

			PlayerInfo[playerid][pSDT2] = sdtdanhba;

			format(string, sizeof(string), "UPDATE `accounts` SET `SDT2`=%d WHERE `id` = %d",number_format(sdtdanhba), GetPlayerSQLId(playerid));
			mysql_function_query(MainPipeline, string, false, "OnQueryFinish", "ii", SENDDATA_THREAD, playerid);

			format(string, sizeof(string), "Ban da them thanh cong so dien thoai %d duoi ten %s.",PlayerInfo[playerid][pSDT2], PlayerInfo[playerid][pDanhBa2]);
			SendClientMessageEx(playerid, COLOR_YELLOW, string);
		}
    }

    //________________________________________________________________________//
	if(dialogid == DANHBA_3)
    {
        if(response)
        {
            if(listitem == 0){ // GOI
				if(PlayerInfo[playerid][pSDT3] != 0){
				    new str[2460], str1[1280], str2[1280], str3[1280], str4[1280], name[1280];
					format(str1, sizeof(str), "THONG TIN CUOC GOI : ");
				    format(str2, sizeof(str), "    -> Ten nguoi nhan : %s", PlayerInfo[playerid][pDanhBa3]);
				    format(str3, sizeof(str), "    -> SDT : %d", PlayerInfo[playerid][pSDT3]);
				    format(str4, sizeof(str), "Neu ban muon goi dien cho nguoi nay, vui long nhan 'Goi ngay' de bat dau cuoc goi");
				    format(str, sizeof(str), "%s\n\n%s\n%s\n%s", str1,str2,str3,str4);
				    format(name, sizeof(name), "DIEN THOAI");
					ShowPlayerDialog(playerid, GOIDIEN_3, DIALOG_STYLE_MSGBOX, name, str, "Goi ngay", "Huy Bo");
					return 1;
				}else ShowPlayerDialog(playerid, DIALOG_NOTHING, DIALOG_STYLE_MSGBOX, "DIEN THOAI","Hien tai danh ba nay van dang con trong , ban vui long them nguoi than vao danh ba slot nay de goi dien...","Dong y", "");
            }
            if(listitem == 1){ // NHAN TIN
				if(PlayerInfo[playerid][pSDT3] != 0){
				    ShowPlayerDialog(playerid, NHANTIN_3, DIALOG_STYLE_INPUT, "Nhan tin", "Vui long nhap tin nhan", "Gui", "Huy");
				    return 1;
				}else ShowPlayerDialog(playerid, DIALOG_NOTHING, DIALOG_STYLE_MSGBOX, "DIEN THOAI","Hien tai danh ba nay van dang con trong , ban vui long them nguoi than vao danh ba slot nay de nhan tin...","Dong y", "");
            }
            if(listitem == 2){ // EDIT DANH BA
                ShowPlayerDialog(playerid, EDITDB_3, DIALOG_STYLE_INPUT, "Them/Sua so dien thoai", "Vui long dien ten hien thi", "Tiep Tuc", "Tro lai");
                return 1;
			}
			if(listitem == 3){ // XOA DANH BA
	            PlayerInfo[playerid][pSDT3] = 0;
	            format(PlayerInfo[playerid][pDanhBa3], 32, "None");
	            SendClientMessageEx(playerid, COLOR_YELLOW, "Ban da xoa danh ba thanh cong !.");
			}
			if(listitem == 4) { // SHOW CHUYEN TIEN
			    ShowChuyenTien(playerid);
			}
        }
	}

	if(dialogid == GOIDIEN_3)
    {
        if(response){
            new phonenumb = PlayerInfo[playerid][pSDT3];
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
			if(PlayerInfo[playerid][pPnumber] == 0)
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong co dien thoai.");
				return 1;
			}
			if(PhoneOnline[playerid] > 0)
			{
				SendClientMessageEx(playerid, COLOR_GREY, "Dien thoai cua ban dang tat.");
				return 1;
			}
			if(GetPVarType(playerid, "PlayerCuffed") || GetPVarType(playerid, "Injured") || GetPVarType(playerid, "IsFrozen")) {
		   		return SendClientMessage(playerid, COLOR_GRAD2, "Ban khong the lam dieu do vao luc nay!");
			}
			format(string, sizeof(string), "* %s lay dien thoai di dong tu tui quan ra.", GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			if(phonenumb == PlayerInfo[playerid][pPnumber])
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "  Dien thoai nguoi do dang ban...");
				return 1;
			}
			if(Mobile[playerid] != INVALID_PLAYER_ID)
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "  Ban dang co mot cuoc goi...");
				return 1;
			}

			foreach(new i: Player)
			{
				if(PlayerInfo[i][pPnumber] == phonenumb && phonenumb != 0)
				{
					new giveplayerid = i;
					Mobile[playerid] = giveplayerid; //caller connecting
					if(IsPlayerConnected(giveplayerid))
					{
						if(giveplayerid != INVALID_PLAYER_ID)
						{
							if(PhoneOnline[giveplayerid] > 0)
							{
								SendClientMessageEx(playerid, COLOR_GREY, "Dien thoai nguoi do dang tat.");
								Mobile[playerid] = INVALID_PLAYER_ID;
								return 1;
							}
							if(Mobile[giveplayerid] != INVALID_PLAYER_ID)
							{
								SendClientMessageEx(playerid, COLOR_GRAD2, "Dien thoai nguoi do dang ban...");
								Mobile[playerid] = INVALID_PLAYER_ID;
								return 1;
							}
							if(Spectating[giveplayerid]!=0)
							{
								SendClientMessageEx(playerid, COLOR_GRAD2, "Dien thoai nguoi do dang ban...");
								Mobile[playerid] = INVALID_PLAYER_ID;
								return 1;
							}
							if (Mobile[giveplayerid] == INVALID_PLAYER_ID)
							{
								format(string, sizeof(string), "Dien thoai di dong cua ban dang vang len - su dung /p de tra loi. [Nguoi goi ID: %s]", GetPlayerNameEx(playerid));
								SendClientMessageEx(giveplayerid, COLOR_YELLOW, string);
								RingTone[giveplayerid] = 10;
								format(string, sizeof(string), "* %s's dien thoai dang do chuong.", GetPlayerNameEx(i));
								SendClientMessageEx(playerid, COLOR_WHITE, "HINT: Bay gio ban co the bam T de tra loi cuoc goi, hoac /h de tat cuoc goi.");
								ProxDetector(30.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
								new Float:rX, Float:rY, Float:rZ;
								GetPlayerPos(giveplayerid, rX, rY, rZ);
								CellTime[playerid] = 1;
								SetPlayerAttachedObject(playerid, 9, 330, 6);
								return SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
							}
						}
					}
				}
			}
        }
    }

    if(dialogid == NHANTIN_3)
    {
       if(response)
       {
			new phonenumb = PlayerInfo[playerid][pSDT3];
    	    if(Spectating[playerid] == 0)
			{
				format(string, sizeof(string), "* %s lay dien thoai di dong tu trong tui quan.", GetPlayerNameEx(playerid));
				ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			}
			if(phonenumb == 555)
			{
				if ((strcmp("yes", inputtext, true, strlen(inputtext)) == 0) && (strlen(inputtext) == strlen("yes")))
				{
					SendClientMessageEx(playerid, COLOR_WHITE, "Tin nhan van ban.");
					SendClientMessageEx(playerid, COLOR_YELLOW, "SMS: Toi dang theo doi ban, Sender: MOLE (555)");
					RingTone[playerid] = 20;
					return 1;
				}
				else
				{
					SendClientMessageEx(playerid, COLOR_YELLOW, "SMS: Toi dang theo doi ban, Sender: MOLE (555)");
					RingTone[playerid] = 20;
					return 1;
				}
			}
			foreach(new i: Player)
			{
				if(PlayerInfo[i][pPnumber] == phonenumb && phonenumb != 0)
				{
					new giveplayerid = i;
					if(Mobile[giveplayerid] != INVALID_PLAYER_ID)
					{
						SendClientMessageEx(playerid, COLOR_GREY, "Dien thoai cua nguoi do dang ban.");
						return 1;
					}
					Mobile[playerid] = giveplayerid; //caller connecting
					if(IsPlayerConnected(giveplayerid))
					{
						if(giveplayerid != INVALID_PLAYER_ID)
						{

							if(PhoneOnline[giveplayerid] > 0)
							{
								SendClientMessageEx(playerid, COLOR_GREY, "Dien thoai cua nguoi do dang tat.");
								Mobile[playerid] = INVALID_PLAYER_ID;
								return 1;
							}
							foreach(new u: Player)
				    		{
				        		if(GetPVarInt(u, "BigEar") == 6 && (GetPVarInt(u, "BigEarPlayer") == playerid || GetPVarInt(u, "BigEarPlayer") == giveplayerid))
				        		{
		       						format(string, sizeof(string), "(BE) %s SMS cho %s: %s", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid), inputtext);
									SendClientMessageEx(u,COLOR_YELLOW, string);
								}
							}
							if(PlayerInfo[playerid][pPhonePrivacy] == 1)
							{
								format(string, sizeof(string), "SMS: %s, Nguoi gui: Khong biet.", inputtext, GetPlayerNameEx(playerid));
							}
							else
							{
								format(string, sizeof(string), "SMS: %s, Nguoi gui: %s (%d)", inputtext, GetPlayerNameEx(playerid), PlayerInfo[playerid][pPnumber]);
							}

							if(i != playerid)
							{
								if(PlayerInfo[i][pSmslog] > 0)
								{
									new query[384], ftext[128];
									mysql_escape_string(inputtext, ftext);
									if(PlayerInfo[playerid][pPhonePrivacy] == 1) format(query, sizeof(query), "INSERT INTO `sms` (`id`, `sender`, `senderid`, `sendernumber`, `receiver`, `receiverid`, `receivernumber`, `message`, `date`) VALUES (NULL, '%s', %d, 0, '%s', %d, %d, '%s', NOW())", GetPlayerNameExt(playerid), GetPlayerSQLId(playerid), GetPlayerNameExt(i), GetPlayerSQLId(i), phonenumb, ftext);
									else format(query, sizeof(query), "INSERT INTO `sms` (`id`, `sender`, `senderid`, `sendernumber`, `receiver`, `receiverid`, `receivernumber`, `message`, `date`) VALUES (NULL, '%s', %d, %d, '%s', %d, %d, '%s', NOW())", GetPlayerNameExt(playerid), GetPlayerSQLId(playerid), PlayerInfo[playerid][pPnumber], GetPlayerNameExt(i), GetPlayerSQLId(i), phonenumb, ftext);
									mysql_function_query(MainPipeline, query, false, "OnQueryFinish", "i", SENDDATA_THREAD);
								}
							}

							RingTone[giveplayerid] =20;
							SendClientMessageEx(giveplayerid, COLOR_YELLOW, string);
							SendClientMessageEx(playerid, COLOR_YELLOW, string);
							SendClientMessageEx(playerid, COLOR_WHITE, "Gui tin nhan van ban");
							
							Mobile[playerid] = INVALID_PLAYER_ID;

							if(strcmp(PlayerInfo[giveplayerid][pAutoTextReply], "Nothing", true) != 0)
							{
								format(string, sizeof(string), "SMS: %s, Nguoi gui: %s [automated response] (%d)", PlayerInfo[giveplayerid][pAutoTextReply], GetPlayerNameEx(giveplayerid), PlayerInfo[giveplayerid][pPnumber]);
								SendClientMessageEx(playerid, COLOR_YELLOW, string);
							}

							return 1;
						}
					}
				}
			}
			SendClientMessageEx(playerid, COLOR_GRAD2, "  Gui tin nhan that bai...");
       }
    }

    if(dialogid == EDITDB_3)
    {
        if(response)
		{
			strmid(PlayerInfo[playerid][pDanhBa3], inputtext, 0, strlen(inputtext), 128);
			format(string, sizeof(string), "UPDATE `accounts` SET `DanhBa3`='%s' WHERE `id`=%d", inputtext, GetPlayerSQLId(playerid));
			mysql_function_query(MainPipeline, string, false, "OnQueryFinish", "i", SENDDATA_THREAD);
			ShowPlayerDialog(playerid, EDITDB_3_3, DIALOG_STYLE_INPUT, "Them/Sua so dien thoai", "Vui long dien so dien thoai", "Tiep Tuc", "Tro lai");
        }
	}

	if(dialogid == EDITDB_3_3)
    {
		if(response)
		{
			new sdtdanhba = strval(inputtext);

			if(~strfind(inputtext, ";") || ~strfind(inputtext, ",") || ~strfind(inputtext, "'") || ~strfind(inputtext, ":") ||
			~strfind(inputtext, "|") || ~strfind(inputtext, "{") || ~strfind(inputtext, "}") || ~strfind(inputtext, "+") ||
			~strfind(inputtext, "?") || ~strfind(inputtext, "/")  || ~strfind(inputtext, " ") ||
			~strfind(inputtext, "@") || ~strfind(inputtext, "[") || ~strfind(inputtext, "]") || ~strfind(inputtext, "<") ||
			~strfind(inputtext, ">") || ~strfind(inputtext, "!") || ~strfind(inputtext, "#") || ~strfind(inputtext, "^") ||
			~strfind(inputtext, "*") || ~strfind(inputtext, "&") || ~strfind(inputtext, "q") || ~strfind(inputtext, "w") ||
			~strfind(inputtext, "e") || ~strfind(inputtext, "r") || ~strfind(inputtext, "t") || ~strfind(inputtext, "y") ||
			~strfind(inputtext, "u") || ~strfind(inputtext, "i") || ~strfind(inputtext, "o") || ~strfind(inputtext, "p") ||
			~strfind(inputtext, "a") || ~strfind(inputtext, "s") || ~strfind(inputtext, "d") || ~strfind(inputtext, "f") ||
			~strfind(inputtext, "g") || ~strfind(inputtext, "h") || ~strfind(inputtext, "j") || ~strfind(inputtext, "k") ||
			~strfind(inputtext, "l") || ~strfind(inputtext, "z") || ~strfind(inputtext, "x") || ~strfind(inputtext, "c") ||
			~strfind(inputtext, "v") || ~strfind(inputtext, "b") || ~strfind(inputtext, "n") || ~strfind(inputtext, "m") ||
			~strfind(inputtext, "(") || ~strfind(inputtext, ")") || ~strfind(inputtext, ".") || ~strfind(inputtext, "%")) return ShowPlayerDialog(playerid, EDITDB_3_3, DIALOG_STYLE_INPUT,"{ff0000}[!]","{ff0000}Vui long nhap so dien thoai bang so.","Chap nhan","Thoat");

			PlayerInfo[playerid][pSDT3] = sdtdanhba;

			format(string, sizeof(string), "UPDATE `accounts` SET `SDT3`=%d WHERE `id` = %d",number_format(sdtdanhba), GetPlayerSQLId(playerid));
			mysql_function_query(MainPipeline, string, false, "OnQueryFinish", "ii", SENDDATA_THREAD, playerid);

			format(string, sizeof(string), "Ban da them thanh cong so dien thoai %d duoi ten %s.",PlayerInfo[playerid][pSDT3], PlayerInfo[playerid][pDanhBa3]);
			SendClientMessageEx(playerid, COLOR_YELLOW, string);
		}
    }

    //________________________________________________________________________//
	if(dialogid == DANHBA_4)
    {
        if(response)
        {
            if(listitem == 0){ // GOI
				if(PlayerInfo[playerid][pSDT4] != 0){
				    new str[2460], str1[1280], str2[1280], str3[1280], str4[1280], name[1280];
					format(str1, sizeof(str), "THONG TIN CUOC GOI : ");
				    format(str2, sizeof(str), "    -> Ten nguoi nhan : %s", PlayerInfo[playerid][pDanhBa4]);
				    format(str3, sizeof(str), "    -> SDT : %d", PlayerInfo[playerid][pSDT4]);
				    format(str4, sizeof(str), "Neu ban muon goi dien cho nguoi nay, vui long nhan 'Goi ngay' de bat dau cuoc goi");
				    format(str, sizeof(str), "%s\n\n%s\n%s\n%s", str1,str2,str3,str4);
				    format(name, sizeof(name), "DIEN THOAI");
					ShowPlayerDialog(playerid, GOIDIEN_4, DIALOG_STYLE_MSGBOX, name, str, "Goi ngay", "Huy Bo");
					return 1;
				}else ShowPlayerDialog(playerid, DIALOG_NOTHING, DIALOG_STYLE_MSGBOX, "DIEN THOAI","Hien tai danh ba nay van dang con trong , ban vui long them nguoi than vao danh ba slot nay de goi dien...","Dong y", "");
            }
            if(listitem == 1){ // NHAN TIN
				if(PlayerInfo[playerid][pSDT4] != 0){
				    ShowPlayerDialog(playerid, NHANTIN_4, DIALOG_STYLE_INPUT, "Nhan tin", "Vui long nhap tin nhan", "Gui", "Huy");
				    return 1;
				}else ShowPlayerDialog(playerid, DIALOG_NOTHING, DIALOG_STYLE_MSGBOX, "DIEN THOAI","Hien tai danh ba nay van dang con trong , ban vui long them nguoi than vao danh ba slot nay de nhan tin...","Dong y", "");
            }
            if(listitem == 2){ // EDIT DANH BA
                ShowPlayerDialog(playerid, EDITDB_4, DIALOG_STYLE_INPUT, "Them/Sua so dien thoai", "Vui long dien ten hien thi", "Tiep Tuc", "Tro lai");
                return 1;
			}
			if(listitem == 3){ // XOA DANH BA
	            PlayerInfo[playerid][pSDT4] = 0;
	            format(PlayerInfo[playerid][pDanhBa4], 32, "None");
	            SendClientMessageEx(playerid, COLOR_YELLOW, "Ban da xoa danh ba thanh cong !.");
			}
			if(listitem == 4) { // SHOW CHUYEN TIEN
			    ShowChuyenTien(playerid);
			}
        }
	}

	if(dialogid == GOIDIEN_4)
    {
        if(response){
            new phonenumb = PlayerInfo[playerid][pSDT4];
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
			if(PlayerInfo[playerid][pPnumber] == 0)
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong co dien thoai.");
				return 1;
			}
			if(PhoneOnline[playerid] > 0)
			{
				SendClientMessageEx(playerid, COLOR_GREY, "Dien thoai cua ban dang tat.");
				return 1;
			}
			if(GetPVarType(playerid, "PlayerCuffed") || GetPVarType(playerid, "Injured") || GetPVarType(playerid, "IsFrozen")) {
		   		return SendClientMessage(playerid, COLOR_GRAD2, "Ban khong the lam dieu do vao luc nay!");
			}
			format(string, sizeof(string), "* %s lay dien thoai di dong tu tui quan ra.", GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			if(phonenumb == PlayerInfo[playerid][pPnumber])
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "  Dien thoai nguoi do dang ban...");
				return 1;
			}
			if(Mobile[playerid] != INVALID_PLAYER_ID)
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "  Ban dang co mot cuoc goi...");
				return 1;
			}

			foreach(new i: Player)
			{
				if(PlayerInfo[i][pPnumber] == phonenumb && phonenumb != 0)
				{
					new giveplayerid = i;
					Mobile[playerid] = giveplayerid; //caller connecting
					if(IsPlayerConnected(giveplayerid))
					{
						if(giveplayerid != INVALID_PLAYER_ID)
						{
							if(PhoneOnline[giveplayerid] > 0)
							{
								SendClientMessageEx(playerid, COLOR_GREY, "Dien thoai nguoi do dang tat.");
								Mobile[playerid] = INVALID_PLAYER_ID;
								return 1;
							}
							if(Mobile[giveplayerid] != INVALID_PLAYER_ID)
							{
								SendClientMessageEx(playerid, COLOR_GRAD2, "Dien thoai nguoi do dang ban...");
								Mobile[playerid] = INVALID_PLAYER_ID;
								return 1;
							}
							if(Spectating[giveplayerid]!=0)
							{
								SendClientMessageEx(playerid, COLOR_GRAD2, "Dien thoai nguoi do dang ban...");
								Mobile[playerid] = INVALID_PLAYER_ID;
								return 1;
							}
							if (Mobile[giveplayerid] == INVALID_PLAYER_ID)
							{
								format(string, sizeof(string), "Dien thoai di dong cua ban dang vang len - su dung /p de tra loi. [Nguoi goi ID: %s]", GetPlayerNameEx(playerid));
								SendClientMessageEx(giveplayerid, COLOR_YELLOW, string);
								RingTone[giveplayerid] = 10;
								format(string, sizeof(string), "* %s's dien thoai dang do chuong.", GetPlayerNameEx(i));
								SendClientMessageEx(playerid, COLOR_WHITE, "HINT: Bay gio ban co the bam T de tra loi cuoc goi, hoac /h de tat cuoc goi.");
								ProxDetector(30.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
								new Float:rX, Float:rY, Float:rZ;
								GetPlayerPos(giveplayerid, rX, rY, rZ);
								CellTime[playerid] = 1;
								SetPlayerAttachedObject(playerid, 9, 330, 6);
								return SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
							}
						}
					}
				}
			}
        }
    }

    if(dialogid == NHANTIN_4)
    {
       if(response)
       {
			new phonenumb = PlayerInfo[playerid][pSDT4];
    	    if(Spectating[playerid] == 0)
			{
				format(string, sizeof(string), "* %s lay dien thoai di dong tu trong tui quan.", GetPlayerNameEx(playerid));
				ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			}

			if(phonenumb == 555)
			{
				if ((strcmp("yes", inputtext, true, strlen(inputtext)) == 0) && (strlen(inputtext) == strlen("yes")))
				{
					SendClientMessageEx(playerid, COLOR_WHITE, "Tin nhan van ban.");
					SendClientMessageEx(playerid, COLOR_YELLOW, "SMS: Toi dang theo doi ban, Sender: MOLE (555)");
					RingTone[playerid] = 20;
					return 1;
				}
				else
				{
					SendClientMessageEx(playerid, COLOR_YELLOW, "SMS: Toi dang theo doi ban, Sender: MOLE (555)");
					RingTone[playerid] = 20;
					return 1;
				}
			}
			foreach(new i: Player)
			{
				if(PlayerInfo[i][pPnumber] == phonenumb && phonenumb != 0)
				{
					new giveplayerid = i;
					if(Mobile[giveplayerid] != INVALID_PLAYER_ID)
					{
						SendClientMessageEx(playerid, COLOR_GREY, "Dien thoai cua nguoi do dang ban.");
						return 1;
					}
					Mobile[playerid] = giveplayerid; //caller connecting
					if(IsPlayerConnected(giveplayerid))
					{
						if(giveplayerid != INVALID_PLAYER_ID)
						{

							if(PhoneOnline[giveplayerid] > 0)
							{
								SendClientMessageEx(playerid, COLOR_GREY, "Dien thoai cua nguoi do dang tat.");
								Mobile[playerid] = INVALID_PLAYER_ID;
								return 1;
							}
							foreach(new u: Player)
				    		{
				        		if(GetPVarInt(u, "BigEar") == 6 && (GetPVarInt(u, "BigEarPlayer") == playerid || GetPVarInt(u, "BigEarPlayer") == giveplayerid))
				        		{
		       						format(string, sizeof(string), "(BE) %s SMS cho %s: %s", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid), inputtext);
									SendClientMessageEx(u,COLOR_YELLOW, string);
								}
							}
							if(PlayerInfo[playerid][pPhonePrivacy] == 1)
							{
								format(string, sizeof(string), "SMS: %s, Nguoi gui: Khong biet.", inputtext, GetPlayerNameEx(playerid));
							}
							else
							{
								format(string, sizeof(string), "SMS: %s, Nguoi gui: %s (%d)", inputtext, GetPlayerNameEx(playerid), PlayerInfo[playerid][pPnumber]);
							}

							if(i != playerid)
							{
								if(PlayerInfo[i][pSmslog] > 0)
								{
									new query[384], ftext[128];
									mysql_escape_string(inputtext, ftext);
									if(PlayerInfo[playerid][pPhonePrivacy] == 1) format(query, sizeof(query), "INSERT INTO `sms` (`id`, `sender`, `senderid`, `sendernumber`, `receiver`, `receiverid`, `receivernumber`, `message`, `date`) VALUES (NULL, '%s', %d, 0, '%s', %d, %d, '%s', NOW())", GetPlayerNameExt(playerid), GetPlayerSQLId(playerid), GetPlayerNameExt(i), GetPlayerSQLId(i), phonenumb, ftext);
									else format(query, sizeof(query), "INSERT INTO `sms` (`id`, `sender`, `senderid`, `sendernumber`, `receiver`, `receiverid`, `receivernumber`, `message`, `date`) VALUES (NULL, '%s', %d, %d, '%s', %d, %d, '%s', NOW())", GetPlayerNameExt(playerid), GetPlayerSQLId(playerid), PlayerInfo[playerid][pPnumber], GetPlayerNameExt(i), GetPlayerSQLId(i), phonenumb, ftext);
									mysql_function_query(MainPipeline, query, false, "OnQueryFinish", "i", SENDDATA_THREAD);
								}
							}

							RingTone[giveplayerid] =20;
							SendClientMessageEx(giveplayerid, COLOR_YELLOW, string);
							SendClientMessageEx(playerid, COLOR_YELLOW, string);
							SendClientMessageEx(playerid, COLOR_WHITE, "Gui tin nhan van ban");
							
							Mobile[playerid] = INVALID_PLAYER_ID;

							if(strcmp(PlayerInfo[giveplayerid][pAutoTextReply], "Nothing", true) != 0)
							{
								format(string, sizeof(string), "SMS: %s, Nguoi gui: %s [automated response] (%d)", PlayerInfo[giveplayerid][pAutoTextReply], GetPlayerNameEx(giveplayerid), PlayerInfo[giveplayerid][pPnumber]);
								SendClientMessageEx(playerid, COLOR_YELLOW, string);
							}

							return 1;
						}
					}
				}
			}
			SendClientMessageEx(playerid, COLOR_GRAD2, "  Gui tin nhan that bai...");
       }
    }

    if(dialogid == EDITDB_4)
    {
        if(response)
		{
			strmid(PlayerInfo[playerid][pDanhBa4], inputtext, 0, strlen(inputtext), 128);
			format(string, sizeof(string), "UPDATE `accounts` SET `DanhBa4`='%s' WHERE `id`=%d", inputtext, GetPlayerSQLId(playerid));
			mysql_function_query(MainPipeline, string, false, "OnQueryFinish", "i", SENDDATA_THREAD);
			ShowPlayerDialog(playerid, EDITDB_4_4, DIALOG_STYLE_INPUT, "Them/Sua so dien thoai", "Vui long dien so dien thoai", "Tiep Tuc", "Tro lai");
        }
	}

	if(dialogid == EDITDB_4_4)
    {
		if(response)
		{
			new sdtdanhba = strval(inputtext);

			if(~strfind(inputtext, ";") || ~strfind(inputtext, ",") || ~strfind(inputtext, "'") || ~strfind(inputtext, ":") ||
			~strfind(inputtext, "|") || ~strfind(inputtext, "{") || ~strfind(inputtext, "}") || ~strfind(inputtext, "+") ||
			~strfind(inputtext, "?") || ~strfind(inputtext, "/")  || ~strfind(inputtext, " ") ||
			~strfind(inputtext, "@") || ~strfind(inputtext, "[") || ~strfind(inputtext, "]") || ~strfind(inputtext, "<") ||
			~strfind(inputtext, ">") || ~strfind(inputtext, "!") || ~strfind(inputtext, "#") || ~strfind(inputtext, "^") ||
			~strfind(inputtext, "*") || ~strfind(inputtext, "&") || ~strfind(inputtext, "q") || ~strfind(inputtext, "w") ||
			~strfind(inputtext, "e") || ~strfind(inputtext, "r") || ~strfind(inputtext, "t") || ~strfind(inputtext, "y") ||
			~strfind(inputtext, "u") || ~strfind(inputtext, "i") || ~strfind(inputtext, "o") || ~strfind(inputtext, "p") ||
			~strfind(inputtext, "a") || ~strfind(inputtext, "s") || ~strfind(inputtext, "d") || ~strfind(inputtext, "f") ||
			~strfind(inputtext, "g") || ~strfind(inputtext, "h") || ~strfind(inputtext, "j") || ~strfind(inputtext, "k") ||
			~strfind(inputtext, "l") || ~strfind(inputtext, "z") || ~strfind(inputtext, "x") || ~strfind(inputtext, "c") ||
			~strfind(inputtext, "v") || ~strfind(inputtext, "b") || ~strfind(inputtext, "n") || ~strfind(inputtext, "m") ||
			~strfind(inputtext, "(") || ~strfind(inputtext, ")") || ~strfind(inputtext, ".") || ~strfind(inputtext, "%")) return ShowPlayerDialog(playerid, EDITDB_4_4, DIALOG_STYLE_INPUT,"{ff0000}[!]","{ff0000}Vui long nhap so dien thoai bang so.","Chap nhan","Thoat");

			PlayerInfo[playerid][pSDT4] = sdtdanhba;

			format(string, sizeof(string), "UPDATE `accounts` SET `SDT4`=%d WHERE `id` = %d",number_format(sdtdanhba), GetPlayerSQLId(playerid));
			mysql_function_query(MainPipeline, string, false, "OnQueryFinish", "ii", SENDDATA_THREAD, playerid);

			format(string, sizeof(string), "Ban da them thanh cong so dien thoai %d duoi ten %s.",PlayerInfo[playerid][pSDT4], PlayerInfo[playerid][pDanhBa4]);
			SendClientMessageEx(playerid, COLOR_YELLOW, string);
		}
    }

    //________________________________________________________________________//
	if(dialogid == DANHBA_5)
    {
        if(response)
        {
            if(listitem == 0){ // GOI
				if(PlayerInfo[playerid][pSDT5] != 0){
				    new str[2460], str1[1280], str2[1280], str3[1280], str4[1280], name[1280];
					format(str1, sizeof(str), "THONG TIN CUOC GOI : ");
				    format(str2, sizeof(str), "    -> Ten nguoi nhan : %s", PlayerInfo[playerid][pDanhBa5]);
				    format(str3, sizeof(str), "    -> SDT : %d", PlayerInfo[playerid][pSDT5]);
				    format(str4, sizeof(str), "Neu ban muon goi dien cho nguoi nay, vui long nhan 'Goi ngay' de bat dau cuoc goi");
				    format(str, sizeof(str), "%s\n\n%s\n%s\n%s", str1,str2,str3,str4);
				    format(name, sizeof(name), "DIEN THOAI");
					ShowPlayerDialog(playerid, GOIDIEN_5, DIALOG_STYLE_MSGBOX, name, str, "Goi ngay", "Huy Bo");
					return 1;
				}else ShowPlayerDialog(playerid, DIALOG_NOTHING, DIALOG_STYLE_MSGBOX, "DIEN THOAI","Hien tai danh ba nay van dang con trong , ban vui long them nguoi than vao danh ba slot nay de goi dien...","Dong y", "");
            }
            if(listitem == 1){ // NHAN TIN
				if(PlayerInfo[playerid][pSDT5] != 0){
				    ShowPlayerDialog(playerid, NHANTIN_5, DIALOG_STYLE_INPUT, "Nhan tin", "Vui long nhap tin nhan", "Gui", "Huy");
				    return 1;
				}else ShowPlayerDialog(playerid, DIALOG_NOTHING, DIALOG_STYLE_MSGBOX, "DIEN THOAI","Hien tai danh ba nay van dang con trong , ban vui long them nguoi than vao danh ba slot nay de nhan tin...","Dong y", "");
            }
            if(listitem == 2){ // EDIT DANH BA
                ShowPlayerDialog(playerid, EDITDB_5, DIALOG_STYLE_INPUT, "Them/Sua so dien thoai", "Vui long dien ten hien thi", "Tiep Tuc", "Tro lai");
                return 1;
			}
			if(listitem == 3){ // XOA DANH BA
	            PlayerInfo[playerid][pSDT5] = 0;
	            format(PlayerInfo[playerid][pDanhBa5], 32, "None");
	            SendClientMessageEx(playerid, COLOR_YELLOW, "Ban da xoa danh ba thanh cong !.");
			}
			if(listitem == 4) { // SHOW CHUYEN TIEN
			    ShowChuyenTien(playerid);
			}
        }
	}

	if(dialogid == GOIDIEN_5)
    {
        if(response){
            new phonenumb = PlayerInfo[playerid][pSDT5];
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
			if(PlayerInfo[playerid][pPnumber] == 0)
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong co dien thoai.");
				return 1;
			}
			if(PhoneOnline[playerid] > 0)
			{
				SendClientMessageEx(playerid, COLOR_GREY, "Dien thoai cua ban dang tat.");
				return 1;
			}
			if(GetPVarType(playerid, "PlayerCuffed") || GetPVarType(playerid, "Injured") || GetPVarType(playerid, "IsFrozen")) {
		   		return SendClientMessage(playerid, COLOR_GRAD2, "Ban khong the lam dieu do vao luc nay!");
			}
			format(string, sizeof(string), "* %s lay dien thoai di dong tu tui quan ra.", GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			if(phonenumb == PlayerInfo[playerid][pPnumber])
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "  Dien thoai nguoi do dang ban...");
				return 1;
			}
			if(Mobile[playerid] != INVALID_PLAYER_ID)
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "  Ban dang co mot cuoc goi...");
				return 1;
			}

			foreach(new i: Player)
			{
				if(PlayerInfo[i][pPnumber] == phonenumb && phonenumb != 0)
				{
					new giveplayerid = i;
					Mobile[playerid] = giveplayerid; //caller connecting
					if(IsPlayerConnected(giveplayerid))
					{
						if(giveplayerid != INVALID_PLAYER_ID)
						{
							if(PhoneOnline[giveplayerid] > 0)
							{
								SendClientMessageEx(playerid, COLOR_GREY, "Dien thoai nguoi do dang tat.");
								Mobile[playerid] = INVALID_PLAYER_ID;
								return 1;
							}
							if(Mobile[giveplayerid] != INVALID_PLAYER_ID)
							{
								SendClientMessageEx(playerid, COLOR_GRAD2, "Dien thoai nguoi do dang ban...");
								Mobile[playerid] = INVALID_PLAYER_ID;
								return 1;
							}
							if(Spectating[giveplayerid]!=0)
							{
								SendClientMessageEx(playerid, COLOR_GRAD2, "Dien thoai nguoi do dang ban...");
								Mobile[playerid] = INVALID_PLAYER_ID;
								return 1;
							}
							if (Mobile[giveplayerid] == INVALID_PLAYER_ID)
							{
								format(string, sizeof(string), "Dien thoai di dong cua ban dang vang len - su dung /p de tra loi. [Nguoi goi ID: %s]", GetPlayerNameEx(playerid));
								SendClientMessageEx(giveplayerid, COLOR_YELLOW, string);
								RingTone[giveplayerid] = 10;
								format(string, sizeof(string), "* %s's dien thoai dang do chuong.", GetPlayerNameEx(i));
								SendClientMessageEx(playerid, COLOR_WHITE, "HINT: Bay gio ban co the bam T de tra loi cuoc goi, hoac /h de tat cuoc goi.");
								ProxDetector(30.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
								new Float:rX, Float:rY, Float:rZ;
								GetPlayerPos(giveplayerid, rX, rY, rZ);
								CellTime[playerid] = 1;
								SetPlayerAttachedObject(playerid, 9, 330, 6);
								return SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
							}
						}
					}
				}
			}
        }
    }

    if(dialogid == NHANTIN_5)
    {
       if(response)
       {
			new phonenumb = PlayerInfo[playerid][pSDT5];
    	    if(Spectating[playerid] == 0)
			{
				format(string, sizeof(string), "* %s lay dien thoai di dong tu trong tui quan.", GetPlayerNameEx(playerid));
				ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			}

			if(phonenumb == 555)
			{
				if ((strcmp("yes", inputtext, true, strlen(inputtext)) == 0) && (strlen(inputtext) == strlen("yes")))
				{
					SendClientMessageEx(playerid, COLOR_WHITE, "Tin nhan van ban.");
					SendClientMessageEx(playerid, COLOR_YELLOW, "SMS: Toi dang theo doi ban, Sender: MOLE (555)");
					RingTone[playerid] = 20;
					return 1;
				}
				else
				{
					SendClientMessageEx(playerid, COLOR_YELLOW, "SMS: Toi dang theo doi ban, Sender: MOLE (555)");
					RingTone[playerid] = 20;
					return 1;
				}
			}
			foreach(new i: Player)
			{
				if(PlayerInfo[i][pPnumber] == phonenumb && phonenumb != 0)
				{
					new giveplayerid = i;
					if(Mobile[giveplayerid] != INVALID_PLAYER_ID)
					{
						SendClientMessageEx(playerid, COLOR_GREY, "Dien thoai cua nguoi do dang ban.");
						return 1;
					}
					Mobile[playerid] = giveplayerid; //caller connecting
					if(IsPlayerConnected(giveplayerid))
					{
						if(giveplayerid != INVALID_PLAYER_ID)
						{

							if(PhoneOnline[giveplayerid] > 0)
							{
								SendClientMessageEx(playerid, COLOR_GREY, "Dien thoai cua nguoi do dang tat.");
								Mobile[playerid] = INVALID_PLAYER_ID;
								return 1;
							}
							foreach(new u: Player)
				    		{
				        		if(GetPVarInt(u, "BigEar") == 6 && (GetPVarInt(u, "BigEarPlayer") == playerid || GetPVarInt(u, "BigEarPlayer") == giveplayerid))
				        		{
		       						format(string, sizeof(string), "(BE) %s SMS cho %s: %s", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid), inputtext);
									SendClientMessageEx(u,COLOR_YELLOW, string);
								}
							}
							if(PlayerInfo[playerid][pPhonePrivacy] == 1)
							{
								format(string, sizeof(string), "SMS: %s, Nguoi gui: Khong biet.", inputtext, GetPlayerNameEx(playerid));
							}
							else
							{
								format(string, sizeof(string), "SMS: %s, Nguoi gui: %s (%d)", inputtext, GetPlayerNameEx(playerid), PlayerInfo[playerid][pPnumber]);
							}

							if(i != playerid)
							{
								if(PlayerInfo[i][pSmslog] > 0)
								{
									new query[384], ftext[128];
									mysql_escape_string(inputtext, ftext);
									if(PlayerInfo[playerid][pPhonePrivacy] == 1) format(query, sizeof(query), "INSERT INTO `sms` (`id`, `sender`, `senderid`, `sendernumber`, `receiver`, `receiverid`, `receivernumber`, `message`, `date`) VALUES (NULL, '%s', %d, 0, '%s', %d, %d, '%s', NOW())", GetPlayerNameExt(playerid), GetPlayerSQLId(playerid), GetPlayerNameExt(i), GetPlayerSQLId(i), phonenumb, ftext);
									else format(query, sizeof(query), "INSERT INTO `sms` (`id`, `sender`, `senderid`, `sendernumber`, `receiver`, `receiverid`, `receivernumber`, `message`, `date`) VALUES (NULL, '%s', %d, %d, '%s', %d, %d, '%s', NOW())", GetPlayerNameExt(playerid), GetPlayerSQLId(playerid), PlayerInfo[playerid][pPnumber], GetPlayerNameExt(i), GetPlayerSQLId(i), phonenumb, ftext);
									mysql_function_query(MainPipeline, query, false, "OnQueryFinish", "i", SENDDATA_THREAD);
								}
							}

							RingTone[giveplayerid] =20;
							SendClientMessageEx(giveplayerid, COLOR_YELLOW, string);
							SendClientMessageEx(playerid, COLOR_YELLOW, string);
							SendClientMessageEx(playerid, COLOR_WHITE, "Gui tin nhan van ban");
							
							Mobile[playerid] = INVALID_PLAYER_ID;

							if(strcmp(PlayerInfo[giveplayerid][pAutoTextReply], "Nothing", true) != 0)
							{
								format(string, sizeof(string), "SMS: %s, Nguoi gui: %s [automated response] (%d)", PlayerInfo[giveplayerid][pAutoTextReply], GetPlayerNameEx(giveplayerid), PlayerInfo[giveplayerid][pPnumber]);
								SendClientMessageEx(playerid, COLOR_YELLOW, string);
							}

							return 1;
						}
					}
				}
			}
			SendClientMessageEx(playerid, COLOR_GRAD2, "  Gui tin nhan that bai...");
       }
    }

    if(dialogid == EDITDB_5)
    {
        if(response)
		{
			strmid(PlayerInfo[playerid][pDanhBa5], inputtext, 0, strlen(inputtext), 128);
			format(string, sizeof(string), "UPDATE `accounts` SET `DanhBa5`='%s' WHERE `id`=%d", inputtext, GetPlayerSQLId(playerid));
			mysql_function_query(MainPipeline, string, false, "OnQueryFinish", "i", SENDDATA_THREAD);
			ShowPlayerDialog(playerid, EDITDB_5_5, DIALOG_STYLE_INPUT, "Them/Sua so dien thoai", "Vui long dien so dien thoai", "Tiep Tuc", "Tro lai");
        }
	}

	if(dialogid == EDITDB_5_5)
    {
		if(response)
		{
			new sdtdanhba = strval(inputtext);

			if(~strfind(inputtext, ";") || ~strfind(inputtext, ",") || ~strfind(inputtext, "'") || ~strfind(inputtext, ":") ||
			~strfind(inputtext, "|") || ~strfind(inputtext, "{") || ~strfind(inputtext, "}") || ~strfind(inputtext, "+") ||
			~strfind(inputtext, "?") || ~strfind(inputtext, "/")  || ~strfind(inputtext, " ") ||
			~strfind(inputtext, "@") || ~strfind(inputtext, "[") || ~strfind(inputtext, "]") || ~strfind(inputtext, "<") ||
			~strfind(inputtext, ">") || ~strfind(inputtext, "!") || ~strfind(inputtext, "#") || ~strfind(inputtext, "^") ||
			~strfind(inputtext, "*") || ~strfind(inputtext, "&") || ~strfind(inputtext, "q") || ~strfind(inputtext, "w") ||
			~strfind(inputtext, "e") || ~strfind(inputtext, "r") || ~strfind(inputtext, "t") || ~strfind(inputtext, "y") ||
			~strfind(inputtext, "u") || ~strfind(inputtext, "i") || ~strfind(inputtext, "o") || ~strfind(inputtext, "p") ||
			~strfind(inputtext, "a") || ~strfind(inputtext, "s") || ~strfind(inputtext, "d") || ~strfind(inputtext, "f") ||
			~strfind(inputtext, "g") || ~strfind(inputtext, "h") || ~strfind(inputtext, "j") || ~strfind(inputtext, "k") ||
			~strfind(inputtext, "l") || ~strfind(inputtext, "z") || ~strfind(inputtext, "x") || ~strfind(inputtext, "c") ||
			~strfind(inputtext, "v") || ~strfind(inputtext, "b") || ~strfind(inputtext, "n") || ~strfind(inputtext, "m") ||
			~strfind(inputtext, "(") || ~strfind(inputtext, ")") || ~strfind(inputtext, ".") || ~strfind(inputtext, "%")) return ShowPlayerDialog(playerid, EDITDB_5_5, DIALOG_STYLE_INPUT,"{ff0000}[!]","{ff0000}Vui long nhap so dien thoai bang so.","Chap nhan","Thoat");

			PlayerInfo[playerid][pSDT5] = sdtdanhba;

			format(string, sizeof(string), "UPDATE `accounts` SET `SDT5`=%d WHERE `id` = %d",number_format(sdtdanhba), GetPlayerSQLId(playerid));
			mysql_function_query(MainPipeline, string, false, "OnQueryFinish", "ii", SENDDATA_THREAD, playerid);

			format(string, sizeof(string), "Ban da them thanh cong so dien thoai %d duoi ten %s.",PlayerInfo[playerid][pSDT5], PlayerInfo[playerid][pDanhBa5]);
			SendClientMessageEx(playerid, COLOR_YELLOW, string);
		}
    }

    //________________________________________________________________________//
	if(dialogid == DANHBA_6)
    {
        if(response)
        {
            if(listitem == 0){ // GOI
				if(PlayerInfo[playerid][pSDT6] != 0){
				    new str[2460], str1[1280], str2[1280], str3[1280], str4[1280], name[1280];
					format(str1, sizeof(str), "THONG TIN CUOC GOI : ");
				    format(str2, sizeof(str), "    -> Ten nguoi nhan : %s", PlayerInfo[playerid][pDanhBa6]);
				    format(str3, sizeof(str), "    -> SDT : %d", PlayerInfo[playerid][pSDT6]);
				    format(str4, sizeof(str), "Neu ban muon goi dien cho nguoi nay, vui long nhan 'Goi ngay' de bat dau cuoc goi");
				    format(str, sizeof(str), "%s\n\n%s\n%s\n%s", str1,str2,str3,str4);
				    format(name, sizeof(name), "DIEN THOAI");
					ShowPlayerDialog(playerid, GOIDIEN_6, DIALOG_STYLE_MSGBOX, name, str, "Goi ngay", "Huy Bo");
					return 1;
				}else ShowPlayerDialog(playerid, DIALOG_NOTHING, DIALOG_STYLE_MSGBOX, "DIEN THOAI","Hien tai danh ba nay van dang con trong , ban vui long them nguoi than vao danh ba slot nay de goi dien...","Dong y", "");
            }
            if(listitem == 1){ // NHAN TIN
				if(PlayerInfo[playerid][pSDT6] != 0){
				    ShowPlayerDialog(playerid, NHANTIN_6, DIALOG_STYLE_INPUT, "Nhan tin", "Vui long nhap tin nhan", "Gui", "Huy");
				    return 1;
				}else ShowPlayerDialog(playerid, DIALOG_NOTHING, DIALOG_STYLE_MSGBOX, "DIEN THOAI","Hien tai danh ba nay van dang con trong , ban vui long them nguoi than vao danh ba slot nay de nhan tin...","Dong y", "");
            }
            if(listitem == 2){ // EDIT DANH BA
                ShowPlayerDialog(playerid, EDITDB_6, DIALOG_STYLE_INPUT, "Them/Sua so dien thoai", "Vui long dien ten hien thi", "Tiep Tuc", "Tro lai");
                return 1;
			}
			if(listitem == 3){ // XOA DANH BA
	            PlayerInfo[playerid][pSDT6] = 0;
	            format(PlayerInfo[playerid][pDanhBa6], 32, "None");
	            SendClientMessageEx(playerid, COLOR_YELLOW, "Ban da xoa danh ba thanh cong !.");
			}
			if(listitem == 4) { // SHOW CHUYEN TIEN
			    ShowChuyenTien(playerid);
			}
        }
	}

	if(dialogid == GOIDIEN_6)
    {
        if(response){
            new phonenumb = PlayerInfo[playerid][pSDT6];
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
			if(PlayerInfo[playerid][pPnumber] == 0)
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong co dien thoai.");
				return 1;
			}
			if(PhoneOnline[playerid] > 0)
			{
				SendClientMessageEx(playerid, COLOR_GREY, "Dien thoai cua ban dang tat.");
				return 1;
			}
			if(GetPVarType(playerid, "PlayerCuffed") || GetPVarType(playerid, "Injured") || GetPVarType(playerid, "IsFrozen")) {
		   		return SendClientMessage(playerid, COLOR_GRAD2, "Ban khong the lam dieu do vao luc nay!");
			}
			format(string, sizeof(string), "* %s lay dien thoai di dong tu tui quan ra.", GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			if(phonenumb == PlayerInfo[playerid][pPnumber])
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "  Dien thoai nguoi do dang ban...");
				return 1;
			}
			if(Mobile[playerid] != INVALID_PLAYER_ID)
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "  Ban dang co mot cuoc goi...");
				return 1;
			}

			foreach(new i: Player)
			{
				if(PlayerInfo[i][pPnumber] == phonenumb && phonenumb != 0)
				{
					new giveplayerid = i;
					Mobile[playerid] = giveplayerid; //caller connecting
					if(IsPlayerConnected(giveplayerid))
					{
						if(giveplayerid != INVALID_PLAYER_ID)
						{
							if(PhoneOnline[giveplayerid] > 0)
							{
								SendClientMessageEx(playerid, COLOR_GREY, "Dien thoai nguoi do dang tat.");
								Mobile[playerid] = INVALID_PLAYER_ID;
								return 1;
							}
							if(Mobile[giveplayerid] != INVALID_PLAYER_ID)
							{
								SendClientMessageEx(playerid, COLOR_GRAD2, "Dien thoai nguoi do dang ban...");
								Mobile[playerid] = INVALID_PLAYER_ID;
								return 1;
							}
							if(Spectating[giveplayerid]!=0)
							{
								SendClientMessageEx(playerid, COLOR_GRAD2, "Dien thoai nguoi do dang ban...");
								Mobile[playerid] = INVALID_PLAYER_ID;
								return 1;
							}
							if (Mobile[giveplayerid] == INVALID_PLAYER_ID)
							{
								format(string, sizeof(string), "Dien thoai di dong cua ban dang vang len - su dung /p de tra loi. [Nguoi goi ID: %s]", GetPlayerNameEx(playerid));
								SendClientMessageEx(giveplayerid, COLOR_YELLOW, string);
								RingTone[giveplayerid] = 10;
								format(string, sizeof(string), "* %s's dien thoai dang do chuong.", GetPlayerNameEx(i));
								SendClientMessageEx(playerid, COLOR_WHITE, "HINT: Bay gio ban co the bam T de tra loi cuoc goi, hoac /h de tat cuoc goi.");
								ProxDetector(30.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
								new Float:rX, Float:rY, Float:rZ;
								GetPlayerPos(giveplayerid, rX, rY, rZ);
								CellTime[playerid] = 1;
								SetPlayerAttachedObject(playerid, 9, 330, 6);
								return SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
							}
						}
					}
				}
			}
        }
    }

    if(dialogid == NHANTIN_6)
    {
       if(response)
       {
			new phonenumb = PlayerInfo[playerid][pSDT6];
    	    if(Spectating[playerid] == 0)
			{
				format(string, sizeof(string), "* %s lay dien thoai di dong tu trong tui quan.", GetPlayerNameEx(playerid));
				ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			}
			if(phonenumb == 555)
			{
				if ((strcmp("yes", inputtext, true, strlen(inputtext)) == 0) && (strlen(inputtext) == strlen("yes")))
				{
					SendClientMessageEx(playerid, COLOR_WHITE, "Tin nhan van ban.");
					SendClientMessageEx(playerid, COLOR_YELLOW, "SMS: Toi dang theo doi ban, Sender: MOLE (555)");
					RingTone[playerid] = 20;
					return 1;
				}
				else
				{
					SendClientMessageEx(playerid, COLOR_YELLOW, "SMS: Toi dang theo doi ban, Sender: MOLE (555)");
					RingTone[playerid] = 20;
					return 1;
				}
			}
			foreach(new i: Player)
			{
				if(PlayerInfo[i][pPnumber] == phonenumb && phonenumb != 0)
				{
					new giveplayerid = i;
					if(Mobile[giveplayerid] != INVALID_PLAYER_ID)
					{
						SendClientMessageEx(playerid, COLOR_GREY, "Dien thoai cua nguoi do dang ban.");
						return 1;
					}
					Mobile[playerid] = giveplayerid; //caller connecting
					if(IsPlayerConnected(giveplayerid))
					{
						if(giveplayerid != INVALID_PLAYER_ID)
						{

							if(PhoneOnline[giveplayerid] > 0)
							{
								SendClientMessageEx(playerid, COLOR_GREY, "Dien thoai cua nguoi do dang tat.");
								Mobile[playerid] = INVALID_PLAYER_ID;
								return 1;
							}
							foreach(new u: Player)
				    		{
				        		if(GetPVarInt(u, "BigEar") == 6 && (GetPVarInt(u, "BigEarPlayer") == playerid || GetPVarInt(u, "BigEarPlayer") == giveplayerid))
				        		{
		       						format(string, sizeof(string), "(BE) %s SMS cho %s: %s", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid), inputtext);
									SendClientMessageEx(u,COLOR_YELLOW, string);
								}
							}
							if(PlayerInfo[playerid][pPhonePrivacy] == 1)
							{
								format(string, sizeof(string), "SMS: %s, Nguoi gui: Khong biet.", inputtext, GetPlayerNameEx(playerid));
							}
							else
							{
								format(string, sizeof(string), "SMS: %s, Nguoi gui: %s (%d)", inputtext, GetPlayerNameEx(playerid), PlayerInfo[playerid][pPnumber]);
							}

							if(i != playerid)
							{
								if(PlayerInfo[i][pSmslog] > 0)
								{
									new query[384], ftext[128];
									mysql_escape_string(inputtext, ftext);
									if(PlayerInfo[playerid][pPhonePrivacy] == 1) format(query, sizeof(query), "INSERT INTO `sms` (`id`, `sender`, `senderid`, `sendernumber`, `receiver`, `receiverid`, `receivernumber`, `message`, `date`) VALUES (NULL, '%s', %d, 0, '%s', %d, %d, '%s', NOW())", GetPlayerNameExt(playerid), GetPlayerSQLId(playerid), GetPlayerNameExt(i), GetPlayerSQLId(i), phonenumb, ftext);
									else format(query, sizeof(query), "INSERT INTO `sms` (`id`, `sender`, `senderid`, `sendernumber`, `receiver`, `receiverid`, `receivernumber`, `message`, `date`) VALUES (NULL, '%s', %d, %d, '%s', %d, %d, '%s', NOW())", GetPlayerNameExt(playerid), GetPlayerSQLId(playerid), PlayerInfo[playerid][pPnumber], GetPlayerNameExt(i), GetPlayerSQLId(i), phonenumb, ftext);
									mysql_function_query(MainPipeline, query, false, "OnQueryFinish", "i", SENDDATA_THREAD);
								}
							}

							RingTone[giveplayerid] =20;
							SendClientMessageEx(giveplayerid, COLOR_YELLOW, string);
							SendClientMessageEx(playerid, COLOR_YELLOW, string);
							SendClientMessageEx(playerid, COLOR_WHITE, "Gui tin nhan van ban");
							Mobile[playerid] = INVALID_PLAYER_ID;

							if(strcmp(PlayerInfo[giveplayerid][pAutoTextReply], "Nothing", true) != 0)
							{
								format(string, sizeof(string), "SMS: %s, Nguoi gui: %s [automated response] (%d)", PlayerInfo[giveplayerid][pAutoTextReply], GetPlayerNameEx(giveplayerid), PlayerInfo[giveplayerid][pPnumber]);
								SendClientMessageEx(playerid, COLOR_YELLOW, string);
							}

							return 1;
						}
					}
				}
			}
			SendClientMessageEx(playerid, COLOR_GRAD2, "  Gui tin nhan that bai...");
       }
    }

    if(dialogid == EDITDB_6)
    {
        if(response)
		{
			strmid(PlayerInfo[playerid][pDanhBa6], inputtext, 0, strlen(inputtext), 128);
			format(string, sizeof(string), "UPDATE `accounts` SET `DanhBa6`='%s' WHERE `id`=%d", inputtext, GetPlayerSQLId(playerid));
			mysql_function_query(MainPipeline, string, false, "OnQueryFinish", "i", SENDDATA_THREAD);
			ShowPlayerDialog(playerid, EDITDB_6_6, DIALOG_STYLE_INPUT, "Them/Sua so dien thoai", "Vui long dien so dien thoai", "Tiep Tuc", "Tro lai");
        }
	}

	if(dialogid == EDITDB_6_6)
    {
		if(response)
		{
			new sdtdanhba = strval(inputtext);

			if(~strfind(inputtext, ";") || ~strfind(inputtext, ",") || ~strfind(inputtext, "'") || ~strfind(inputtext, ":") ||
			~strfind(inputtext, "|") || ~strfind(inputtext, "{") || ~strfind(inputtext, "}") || ~strfind(inputtext, "+") ||
			~strfind(inputtext, "?") || ~strfind(inputtext, "/")  || ~strfind(inputtext, " ") ||
			~strfind(inputtext, "@") || ~strfind(inputtext, "[") || ~strfind(inputtext, "]") || ~strfind(inputtext, "<") ||
			~strfind(inputtext, ">") || ~strfind(inputtext, "!") || ~strfind(inputtext, "#") || ~strfind(inputtext, "^") ||
			~strfind(inputtext, "*") || ~strfind(inputtext, "&") || ~strfind(inputtext, "q") || ~strfind(inputtext, "w") ||
			~strfind(inputtext, "e") || ~strfind(inputtext, "r") || ~strfind(inputtext, "t") || ~strfind(inputtext, "y") ||
			~strfind(inputtext, "u") || ~strfind(inputtext, "i") || ~strfind(inputtext, "o") || ~strfind(inputtext, "p") ||
			~strfind(inputtext, "a") || ~strfind(inputtext, "s") || ~strfind(inputtext, "d") || ~strfind(inputtext, "f") ||
			~strfind(inputtext, "g") || ~strfind(inputtext, "h") || ~strfind(inputtext, "j") || ~strfind(inputtext, "k") ||
			~strfind(inputtext, "l") || ~strfind(inputtext, "z") || ~strfind(inputtext, "x") || ~strfind(inputtext, "c") ||
			~strfind(inputtext, "v") || ~strfind(inputtext, "b") || ~strfind(inputtext, "n") || ~strfind(inputtext, "m") ||
			~strfind(inputtext, "(") || ~strfind(inputtext, ")") || ~strfind(inputtext, ".") || ~strfind(inputtext, "%")) return ShowPlayerDialog(playerid, EDITDB_6_6, DIALOG_STYLE_INPUT,"{ff0000}[!]","{ff0000}Vui long nhap so dien thoai bang so.","Chap nhan","Thoat");

			PlayerInfo[playerid][pSDT6] = sdtdanhba;

			format(string, sizeof(string), "UPDATE `accounts` SET `SDT6`=%d WHERE `id` = %d",number_format(sdtdanhba), GetPlayerSQLId(playerid));
			mysql_function_query(MainPipeline, string, false, "OnQueryFinish", "ii", SENDDATA_THREAD, playerid);

			format(string, sizeof(string), "Ban da them thanh cong so dien thoai %d duoi ten %s.",PlayerInfo[playerid][pSDT6], PlayerInfo[playerid][pDanhBa6]);
			SendClientMessageEx(playerid, COLOR_YELLOW, string);
		}
    }

    //________________________________________________________________________//
	if(dialogid == DANHBA_7)
    {
        if(response)
        {
            if(listitem == 0){ // GOI
				if(PlayerInfo[playerid][pSDT7] != 0){
				    new str[2460], str1[1280], str2[1280], str3[1280], str4[1280], name[1280];
					format(str1, sizeof(str), "THONG TIN CUOC GOI : ");
				    format(str2, sizeof(str), "    -> Ten nguoi nhan : %s", PlayerInfo[playerid][pDanhBa7]);
				    format(str3, sizeof(str), "    -> SDT : %d", PlayerInfo[playerid][pSDT7]);
				    format(str4, sizeof(str), "Neu ban muon goi dien cho nguoi nay, vui long nhan 'Goi ngay' de bat dau cuoc goi");
				    format(str, sizeof(str), "%s\n\n%s\n%s\n%s", str1,str2,str3,str4);
				    format(name, sizeof(name), "DIEN THOAI");
					ShowPlayerDialog(playerid, GOIDIEN_7, DIALOG_STYLE_MSGBOX, name, str, "Goi ngay", "Huy Bo");
					return 1;
				}else ShowPlayerDialog(playerid, DIALOG_NOTHING, DIALOG_STYLE_MSGBOX, "DIEN THOAI","Hien tai danh ba nay van dang con trong , ban vui long them nguoi than vao danh ba slot nay de goi dien...","Dong y", "");
            }
            if(listitem == 1){ // NHAN TIN
				if(PlayerInfo[playerid][pSDT7] != 0){
				    ShowPlayerDialog(playerid, NHANTIN_7, DIALOG_STYLE_INPUT, "Nhan tin", "Vui long nhap tin nhan", "Gui", "Huy");
				    return 1;
				}else ShowPlayerDialog(playerid, DIALOG_NOTHING, DIALOG_STYLE_MSGBOX, "DIEN THOAI","Hien tai danh ba nay van dang con trong , ban vui long them nguoi than vao danh ba slot nay de nhan tin...","Dong y", "");
            }
            if(listitem == 2){ // EDIT DANH BA
                ShowPlayerDialog(playerid, EDITDB_7, DIALOG_STYLE_INPUT, "Them/Sua so dien thoai", "Vui long dien ten hien thi", "Tiep Tuc", "Tro lai");
                return 1;
			}
			if(listitem == 3){ // XOA DANH BA
	            PlayerInfo[playerid][pSDT7] = 0;
	            format(PlayerInfo[playerid][pDanhBa7], 32, "None");
	            SendClientMessageEx(playerid, COLOR_YELLOW, "Ban da xoa danh ba thanh cong !.");
			}
			if(listitem == 4) { // SHOW CHUYEN TIEN
			    ShowChuyenTien(playerid);
			}
        }
	}

	if(dialogid == GOIDIEN_7)
    {
        if(response){
            new phonenumb = PlayerInfo[playerid][pSDT7];
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
			if(PlayerInfo[playerid][pPnumber] == 0)
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong co dien thoai.");
				return 1;
			}
			if(PhoneOnline[playerid] > 0)
			{
				SendClientMessageEx(playerid, COLOR_GREY, "Dien thoai cua ban dang tat.");
				return 1;
			}
			if(GetPVarType(playerid, "PlayerCuffed") || GetPVarType(playerid, "Injured") || GetPVarType(playerid, "IsFrozen")) {
		   		return SendClientMessage(playerid, COLOR_GRAD2, "Ban khong the lam dieu do vao luc nay!");
			}
			format(string, sizeof(string), "* %s lay dien thoai di dong tu tui quan ra.", GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			if(phonenumb == PlayerInfo[playerid][pPnumber])
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "  Dien thoai nguoi do dang ban...");
				return 1;
			}
			if(Mobile[playerid] != INVALID_PLAYER_ID)
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "  Ban dang co mot cuoc goi...");
				return 1;
			}

			foreach(new i: Player)
			{
				if(PlayerInfo[i][pPnumber] == phonenumb && phonenumb != 0)
				{
					new giveplayerid = i;
					Mobile[playerid] = giveplayerid; //caller connecting
					if(IsPlayerConnected(giveplayerid))
					{
						if(giveplayerid != INVALID_PLAYER_ID)
						{
							if(PhoneOnline[giveplayerid] > 0)
							{
								SendClientMessageEx(playerid, COLOR_GREY, "Dien thoai nguoi do dang tat.");
								Mobile[playerid] = INVALID_PLAYER_ID;
								return 1;
							}
							if(Mobile[giveplayerid] != INVALID_PLAYER_ID)
							{
								SendClientMessageEx(playerid, COLOR_GRAD2, "Dien thoai nguoi do dang ban...");
								Mobile[playerid] = INVALID_PLAYER_ID;
								return 1;
							}
							if(Spectating[giveplayerid]!=0)
							{
								SendClientMessageEx(playerid, COLOR_GRAD2, "Dien thoai nguoi do dang ban...");
								Mobile[playerid] = INVALID_PLAYER_ID;
								return 1;
							}
							if (Mobile[giveplayerid] == INVALID_PLAYER_ID)
							{
								format(string, sizeof(string), "Dien thoai di dong cua ban dang vang len - su dung /p de tra loi. [Nguoi goi ID: %s]", GetPlayerNameEx(playerid));
								SendClientMessageEx(giveplayerid, COLOR_YELLOW, string);
								RingTone[giveplayerid] = 10;
								format(string, sizeof(string), "* %s's dien thoai dang do chuong.", GetPlayerNameEx(i));
								SendClientMessageEx(playerid, COLOR_WHITE, "HINT: Bay gio ban co the bam T de tra loi cuoc goi, hoac /h de tat cuoc goi.");
								ProxDetector(30.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
								new Float:rX, Float:rY, Float:rZ;
								GetPlayerPos(giveplayerid, rX, rY, rZ);
								CellTime[playerid] = 1;
								SetPlayerAttachedObject(playerid, 9, 330, 6);
								return SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
							}
						}
					}
				}
			}
        }
    }

    if(dialogid == NHANTIN_7)
    {
       if(response)
       {
			new phonenumb = PlayerInfo[playerid][pSDT7];
    	    if(Spectating[playerid] == 0)
			{
				format(string, sizeof(string), "* %s lay dien thoai di dong tu trong tui quan.", GetPlayerNameEx(playerid));
				ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			}
			if(phonenumb == 555)
			{
				if ((strcmp("yes", inputtext, true, strlen(inputtext)) == 0) && (strlen(inputtext) == strlen("yes")))
				{
					SendClientMessageEx(playerid, COLOR_WHITE, "Tin nhan van ban.");
					SendClientMessageEx(playerid, COLOR_YELLOW, "SMS: Toi dang theo doi ban, Sender: MOLE (555)");
					RingTone[playerid] = 20;
					return 1;
				}
				else
				{
					SendClientMessageEx(playerid, COLOR_YELLOW, "SMS: Toi dang theo doi ban, Sender: MOLE (555)");
					RingTone[playerid] = 20;
					return 1;
				}
			}
			foreach(new i: Player)
			{
				if(PlayerInfo[i][pPnumber] == phonenumb && phonenumb != 0)
				{
					new giveplayerid = i;
					if(Mobile[giveplayerid] != INVALID_PLAYER_ID)
					{
						SendClientMessageEx(playerid, COLOR_GREY, "Dien thoai cua nguoi do dang ban.");
						return 1;
					}
					Mobile[playerid] = giveplayerid; //caller connecting
					if(IsPlayerConnected(giveplayerid))
					{
						if(giveplayerid != INVALID_PLAYER_ID)
						{

							if(PhoneOnline[giveplayerid] > 0)
							{
								SendClientMessageEx(playerid, COLOR_GREY, "Dien thoai cua nguoi do dang tat.");
								Mobile[playerid] = INVALID_PLAYER_ID;
								return 1;
							}
							foreach(new u: Player)
				    		{
				        		if(GetPVarInt(u, "BigEar") == 6 && (GetPVarInt(u, "BigEarPlayer") == playerid || GetPVarInt(u, "BigEarPlayer") == giveplayerid))
				        		{
		       						format(string, sizeof(string), "(BE) %s SMS cho %s: %s", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid), inputtext);
									SendClientMessageEx(u,COLOR_YELLOW, string);
								}
							}
							if(PlayerInfo[playerid][pPhonePrivacy] == 1)
							{
								format(string, sizeof(string), "SMS: %s, Nguoi gui: Khong biet.", inputtext, GetPlayerNameEx(playerid));
							}
							else
							{
								format(string, sizeof(string), "SMS: %s, Nguoi gui: %s (%d)", inputtext, GetPlayerNameEx(playerid), PlayerInfo[playerid][pPnumber]);
							}

							if(i != playerid)
							{
								if(PlayerInfo[i][pSmslog] > 0)
								{
									new query[384], ftext[128];
									mysql_escape_string(inputtext, ftext);
									if(PlayerInfo[playerid][pPhonePrivacy] == 1) format(query, sizeof(query), "INSERT INTO `sms` (`id`, `sender`, `senderid`, `sendernumber`, `receiver`, `receiverid`, `receivernumber`, `message`, `date`) VALUES (NULL, '%s', %d, 0, '%s', %d, %d, '%s', NOW())", GetPlayerNameExt(playerid), GetPlayerSQLId(playerid), GetPlayerNameExt(i), GetPlayerSQLId(i), phonenumb, ftext);
									else format(query, sizeof(query), "INSERT INTO `sms` (`id`, `sender`, `senderid`, `sendernumber`, `receiver`, `receiverid`, `receivernumber`, `message`, `date`) VALUES (NULL, '%s', %d, %d, '%s', %d, %d, '%s', NOW())", GetPlayerNameExt(playerid), GetPlayerSQLId(playerid), PlayerInfo[playerid][pPnumber], GetPlayerNameExt(i), GetPlayerSQLId(i), phonenumb, ftext);
									mysql_function_query(MainPipeline, query, false, "OnQueryFinish", "i", SENDDATA_THREAD);
								}
							}

							RingTone[giveplayerid] =20;
							SendClientMessageEx(giveplayerid, COLOR_YELLOW, string);
							SendClientMessageEx(playerid, COLOR_YELLOW, string);
							SendClientMessageEx(playerid, COLOR_WHITE, "Gui tin nhan van ban");
							Mobile[playerid] = INVALID_PLAYER_ID;

							if(strcmp(PlayerInfo[giveplayerid][pAutoTextReply], "Nothing", true) != 0)
							{
								format(string, sizeof(string), "SMS: %s, Nguoi gui: %s [automated response] (%d)", PlayerInfo[giveplayerid][pAutoTextReply], GetPlayerNameEx(giveplayerid), PlayerInfo[giveplayerid][pPnumber]);
								SendClientMessageEx(playerid, COLOR_YELLOW, string);
							}

							return 1;
						}
					}
				}
			}
			SendClientMessageEx(playerid, COLOR_GRAD2, "  Gui tin nhan that bai...");
       }
    }

    if(dialogid == EDITDB_7)
    {
        if(response)
		{
			strmid(PlayerInfo[playerid][pDanhBa7], inputtext, 0, strlen(inputtext), 128);
			format(string, sizeof(string), "UPDATE `accounts` SET `DanhBa7`='%s' WHERE `id`=%d", inputtext, GetPlayerSQLId(playerid));
			mysql_function_query(MainPipeline, string, false, "OnQueryFinish", "i", SENDDATA_THREAD);
			ShowPlayerDialog(playerid, EDITDB_7_7, DIALOG_STYLE_INPUT, "Them/Sua so dien thoai", "Vui long dien so dien thoai", "Tiep Tuc", "Tro lai");
        }
	}

	if(dialogid == EDITDB_7_7)
    {
		if(response)
		{
			new sdtdanhba = strval(inputtext);

			if(~strfind(inputtext, ";") || ~strfind(inputtext, ",") || ~strfind(inputtext, "'") || ~strfind(inputtext, ":") ||
			~strfind(inputtext, "|") || ~strfind(inputtext, "{") || ~strfind(inputtext, "}") || ~strfind(inputtext, "+") ||
			~strfind(inputtext, "?") || ~strfind(inputtext, "/")  || ~strfind(inputtext, " ") ||
			~strfind(inputtext, "@") || ~strfind(inputtext, "[") || ~strfind(inputtext, "]") || ~strfind(inputtext, "<") ||
			~strfind(inputtext, ">") || ~strfind(inputtext, "!") || ~strfind(inputtext, "#") || ~strfind(inputtext, "^") ||
			~strfind(inputtext, "*") || ~strfind(inputtext, "&") || ~strfind(inputtext, "q") || ~strfind(inputtext, "w") ||
			~strfind(inputtext, "e") || ~strfind(inputtext, "r") || ~strfind(inputtext, "t") || ~strfind(inputtext, "y") ||
			~strfind(inputtext, "u") || ~strfind(inputtext, "i") || ~strfind(inputtext, "o") || ~strfind(inputtext, "p") ||
			~strfind(inputtext, "a") || ~strfind(inputtext, "s") || ~strfind(inputtext, "d") || ~strfind(inputtext, "f") ||
			~strfind(inputtext, "g") || ~strfind(inputtext, "h") || ~strfind(inputtext, "j") || ~strfind(inputtext, "k") ||
			~strfind(inputtext, "l") || ~strfind(inputtext, "z") || ~strfind(inputtext, "x") || ~strfind(inputtext, "c") ||
			~strfind(inputtext, "v") || ~strfind(inputtext, "b") || ~strfind(inputtext, "n") || ~strfind(inputtext, "m") ||
			~strfind(inputtext, "(") || ~strfind(inputtext, ")") || ~strfind(inputtext, ".") || ~strfind(inputtext, "%")) return ShowPlayerDialog(playerid, EDITDB_7_7, DIALOG_STYLE_INPUT,"{ff0000}[!]","{ff0000}Vui long nhap so dien thoai bang so.","Chap nhan","Thoat");

			PlayerInfo[playerid][pSDT7] = sdtdanhba;

			format(string, sizeof(string), "UPDATE `accounts` SET `SDT7`=%d WHERE `id` = %d",number_format(sdtdanhba), GetPlayerSQLId(playerid));
			mysql_function_query(MainPipeline, string, false, "OnQueryFinish", "ii", SENDDATA_THREAD, playerid);

			format(string, sizeof(string), "Ban da them thanh cong so dien thoai %d duoi ten %s.",PlayerInfo[playerid][pSDT7], PlayerInfo[playerid][pDanhBa7]);
			SendClientMessageEx(playerid, COLOR_YELLOW, string);
		}
    }

    //________________________________________________________________________//
	if(dialogid == DANHBA_8)
    {
        if(response)
        {
            if(listitem == 0){ // GOI
				if(PlayerInfo[playerid][pSDT8] != 0){
				    new str[2460], str1[1280], str2[1280], str3[1280], str4[1280], name[1280];
					format(str1, sizeof(str), "THONG TIN CUOC GOI : ");
				    format(str2, sizeof(str), "    -> Ten nguoi nhan : %s", PlayerInfo[playerid][pDanhBa8]);
				    format(str3, sizeof(str), "    -> SDT : %d", PlayerInfo[playerid][pSDT8]);
				    format(str4, sizeof(str), "Neu ban muon goi dien cho nguoi nay, vui long nhan 'Goi ngay' de bat dau cuoc goi");
				    format(str, sizeof(str), "%s\n\n%s\n%s\n%s", str1,str2,str3,str4);
				    format(name, sizeof(name), "DIEN THOAI");
					ShowPlayerDialog(playerid, GOIDIEN_8, DIALOG_STYLE_MSGBOX, name, str, "Goi ngay", "Huy Bo");
					return 1;
				}else ShowPlayerDialog(playerid, DIALOG_NOTHING, DIALOG_STYLE_MSGBOX, "DIEN THOAI","Hien tai danh ba nay van dang con trong , ban vui long them nguoi than vao danh ba slot nay de goi dien...","Dong y", "");
            }
            if(listitem == 1){ // NHAN TIN
				if(PlayerInfo[playerid][pSDT8] != 0){
				    ShowPlayerDialog(playerid, NHANTIN_8, DIALOG_STYLE_INPUT, "Nhan tin", "Vui long nhap tin nhan", "Gui", "Huy");
				    return 1;
				}else ShowPlayerDialog(playerid, DIALOG_NOTHING, DIALOG_STYLE_MSGBOX, "DIEN THOAI","Hien tai danh ba nay van dang con trong , ban vui long them nguoi than vao danh ba slot nay de nhan tin...","Dong y", "");
            }
            if(listitem == 2){ // EDIT DANH BA
                ShowPlayerDialog(playerid, EDITDB_8, DIALOG_STYLE_INPUT, "Them/Sua so dien thoai", "Vui long dien ten hien thi", "Tiep Tuc", "Tro lai");
                return 1;
			}
			if(listitem == 3){ // XOA DANH BA
	            PlayerInfo[playerid][pSDT8] = 0;
	            format(PlayerInfo[playerid][pDanhBa8], 32, "None");
	            SendClientMessageEx(playerid, COLOR_YELLOW, "Ban da xoa danh ba thanh cong !.");
			}
			if(listitem == 4) { // SHOW CHUYEN TIEN
			    ShowChuyenTien(playerid);
			}
        }
	}

	if(dialogid == GOIDIEN_8)
    {
        if(response){
            new phonenumb = PlayerInfo[playerid][pSDT8];
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
			if(PlayerInfo[playerid][pPnumber] == 0)
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong co dien thoai.");
				return 1;
			}
			if(PhoneOnline[playerid] > 0)
			{
				SendClientMessageEx(playerid, COLOR_GREY, "Dien thoai cua ban dang tat.");
				return 1;
			}
			if(GetPVarType(playerid, "PlayerCuffed") || GetPVarType(playerid, "Injured") || GetPVarType(playerid, "IsFrozen")) {
		   		return SendClientMessage(playerid, COLOR_GRAD2, "Ban khong the lam dieu do vao luc nay!");
			}
			format(string, sizeof(string), "* %s lay dien thoai di dong tu tui quan ra.", GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			if(phonenumb == PlayerInfo[playerid][pPnumber])
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "  Dien thoai nguoi do dang ban...");
				return 1;
			}
			if(Mobile[playerid] != INVALID_PLAYER_ID)
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "  Ban dang co mot cuoc goi...");
				return 1;
			}

			foreach(new i: Player)
			{
				if(PlayerInfo[i][pPnumber] == phonenumb && phonenumb != 0)
				{
					new giveplayerid = i;
					Mobile[playerid] = giveplayerid; //caller connecting
					if(IsPlayerConnected(giveplayerid))
					{
						if(giveplayerid != INVALID_PLAYER_ID)
						{
							if(PhoneOnline[giveplayerid] > 0)
							{
								SendClientMessageEx(playerid, COLOR_GREY, "Dien thoai nguoi do dang tat.");
								Mobile[playerid] = INVALID_PLAYER_ID;
								return 1;
							}
							if(Mobile[giveplayerid] != INVALID_PLAYER_ID)
							{
								SendClientMessageEx(playerid, COLOR_GRAD2, "Dien thoai nguoi do dang ban...");
								Mobile[playerid] = INVALID_PLAYER_ID;
								return 1;
							}
							if(Spectating[giveplayerid]!=0)
							{
								SendClientMessageEx(playerid, COLOR_GRAD2, "Dien thoai nguoi do dang ban...");
								Mobile[playerid] = INVALID_PLAYER_ID;
								return 1;
							}
							if (Mobile[giveplayerid] == INVALID_PLAYER_ID)
							{
								format(string, sizeof(string), "Dien thoai di dong cua ban dang vang len - su dung /p de tra loi. [Nguoi goi ID: %s]", GetPlayerNameEx(playerid));
								SendClientMessageEx(giveplayerid, COLOR_YELLOW, string);
								RingTone[giveplayerid] = 10;
								format(string, sizeof(string), "* %s's dien thoai dang do chuong.", GetPlayerNameEx(i));
								SendClientMessageEx(playerid, COLOR_WHITE, "HINT: Bay gio ban co the bam T de tra loi cuoc goi, hoac /h de tat cuoc goi.");
								ProxDetector(30.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
								new Float:rX, Float:rY, Float:rZ;
								GetPlayerPos(giveplayerid, rX, rY, rZ);
								CellTime[playerid] = 1;
								SetPlayerAttachedObject(playerid, 9, 330, 6);
								return SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
							}
						}
					}
				}
			}
        }
    }

    if(dialogid == NHANTIN_8)
    {
       if(response)
       {
			new phonenumb = PlayerInfo[playerid][pSDT8];
    	    if(Spectating[playerid] == 0)
			{
				format(string, sizeof(string), "* %s lay dien thoai di dong tu trong tui quan.", GetPlayerNameEx(playerid));
				ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			}

			if(phonenumb == 555)
			{
				if ((strcmp("yes", inputtext, true, strlen(inputtext)) == 0) && (strlen(inputtext) == strlen("yes")))
				{
					SendClientMessageEx(playerid, COLOR_WHITE, "Tin nhan van ban.");
					SendClientMessageEx(playerid, COLOR_YELLOW, "SMS: Toi dang theo doi ban, Sender: MOLE (555)");
					RingTone[playerid] = 20;
					return 1;
				}
				else
				{
					SendClientMessageEx(playerid, COLOR_YELLOW, "SMS: Toi dang theo doi ban, Sender: MOLE (555)");
					RingTone[playerid] = 20;
					return 1;
				}
			}
			foreach(new i: Player)
			{
				if(PlayerInfo[i][pPnumber] == phonenumb && phonenumb != 0)
				{
					new giveplayerid = i;
					if(Mobile[giveplayerid] != INVALID_PLAYER_ID)
					{
						SendClientMessageEx(playerid, COLOR_GREY, "Dien thoai cua nguoi do dang ban.");
						return 1;
					}
					Mobile[playerid] = giveplayerid; //caller connecting
					if(IsPlayerConnected(giveplayerid))
					{
						if(giveplayerid != INVALID_PLAYER_ID)
						{

							if(PhoneOnline[giveplayerid] > 0)
							{
								SendClientMessageEx(playerid, COLOR_GREY, "Dien thoai cua nguoi do dang tat.");
								Mobile[playerid] = INVALID_PLAYER_ID;
								return 1;
							}
							foreach(new u: Player)
				    		{
				        		if(GetPVarInt(u, "BigEar") == 6 && (GetPVarInt(u, "BigEarPlayer") == playerid || GetPVarInt(u, "BigEarPlayer") == giveplayerid))
				        		{
		       						format(string, sizeof(string), "(BE) %s SMS cho %s: %s", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid), inputtext);
									SendClientMessageEx(u,COLOR_YELLOW, string);
								}
							}
							if(PlayerInfo[playerid][pPhonePrivacy] == 1)
							{
								format(string, sizeof(string), "SMS: %s, Nguoi gui: Khong biet.", inputtext, GetPlayerNameEx(playerid));
							}
							else
							{
								format(string, sizeof(string), "SMS: %s, Nguoi gui: %s (%d)", inputtext, GetPlayerNameEx(playerid), PlayerInfo[playerid][pPnumber]);
							}

							if(i != playerid)
							{
								if(PlayerInfo[i][pSmslog] > 0)
								{
									new query[384], ftext[128];
									mysql_escape_string(inputtext, ftext);
									if(PlayerInfo[playerid][pPhonePrivacy] == 1) format(query, sizeof(query), "INSERT INTO `sms` (`id`, `sender`, `senderid`, `sendernumber`, `receiver`, `receiverid`, `receivernumber`, `message`, `date`) VALUES (NULL, '%s', %d, 0, '%s', %d, %d, '%s', NOW())", GetPlayerNameExt(playerid), GetPlayerSQLId(playerid), GetPlayerNameExt(i), GetPlayerSQLId(i), phonenumb, ftext);
									else format(query, sizeof(query), "INSERT INTO `sms` (`id`, `sender`, `senderid`, `sendernumber`, `receiver`, `receiverid`, `receivernumber`, `message`, `date`) VALUES (NULL, '%s', %d, %d, '%s', %d, %d, '%s', NOW())", GetPlayerNameExt(playerid), GetPlayerSQLId(playerid), PlayerInfo[playerid][pPnumber], GetPlayerNameExt(i), GetPlayerSQLId(i), phonenumb, ftext);
									mysql_function_query(MainPipeline, query, false, "OnQueryFinish", "i", SENDDATA_THREAD);
								}
							}

							RingTone[giveplayerid] =20;
							SendClientMessageEx(giveplayerid, COLOR_YELLOW, string);
							SendClientMessageEx(playerid, COLOR_YELLOW, string);
							SendClientMessageEx(playerid, COLOR_WHITE, "Gui tin nhan van ban");
							Mobile[playerid] = INVALID_PLAYER_ID;

							if(strcmp(PlayerInfo[giveplayerid][pAutoTextReply], "Nothing", true) != 0)
							{
								format(string, sizeof(string), "SMS: %s, Nguoi gui: %s [automated response] (%d)", PlayerInfo[giveplayerid][pAutoTextReply], GetPlayerNameEx(giveplayerid), PlayerInfo[giveplayerid][pPnumber]);
								SendClientMessageEx(playerid, COLOR_YELLOW, string);
							}

							return 1;
						}
					}
				}
			}
			SendClientMessageEx(playerid, COLOR_GRAD2, "  Gui tin nhan that bai...");
       }
    }

    if(dialogid == EDITDB_8)
    {
        if(response)
		{
			strmid(PlayerInfo[playerid][pDanhBa8], inputtext, 0, strlen(inputtext), 128);
			format(string, sizeof(string), "UPDATE `accounts` SET `DanhBa8`='%s' WHERE `id`=%d", inputtext, GetPlayerSQLId(playerid));
			mysql_function_query(MainPipeline, string, false, "OnQueryFinish", "i", SENDDATA_THREAD);
			ShowPlayerDialog(playerid, EDITDB_8_8, DIALOG_STYLE_INPUT, "Them/Sua so dien thoai", "Vui long dien so dien thoai", "Tiep Tuc", "Tro lai");
        }
	}

	if(dialogid == EDITDB_8_8)
    {
		if(response)
		{
			new sdtdanhba = strval(inputtext);

			if(~strfind(inputtext, ";") || ~strfind(inputtext, ",") || ~strfind(inputtext, "'") || ~strfind(inputtext, ":") ||
			~strfind(inputtext, "|") || ~strfind(inputtext, "{") || ~strfind(inputtext, "}") || ~strfind(inputtext, "+") ||
			~strfind(inputtext, "?") || ~strfind(inputtext, "/")  || ~strfind(inputtext, " ") ||
			~strfind(inputtext, "@") || ~strfind(inputtext, "[") || ~strfind(inputtext, "]") || ~strfind(inputtext, "<") ||
			~strfind(inputtext, ">") || ~strfind(inputtext, "!") || ~strfind(inputtext, "#") || ~strfind(inputtext, "^") ||
			~strfind(inputtext, "*") || ~strfind(inputtext, "&") || ~strfind(inputtext, "q") || ~strfind(inputtext, "w") ||
			~strfind(inputtext, "e") || ~strfind(inputtext, "r") || ~strfind(inputtext, "t") || ~strfind(inputtext, "y") ||
			~strfind(inputtext, "u") || ~strfind(inputtext, "i") || ~strfind(inputtext, "o") || ~strfind(inputtext, "p") ||
			~strfind(inputtext, "a") || ~strfind(inputtext, "s") || ~strfind(inputtext, "d") || ~strfind(inputtext, "f") ||
			~strfind(inputtext, "g") || ~strfind(inputtext, "h") || ~strfind(inputtext, "j") || ~strfind(inputtext, "k") ||
			~strfind(inputtext, "l") || ~strfind(inputtext, "z") || ~strfind(inputtext, "x") || ~strfind(inputtext, "c") ||
			~strfind(inputtext, "v") || ~strfind(inputtext, "b") || ~strfind(inputtext, "n") || ~strfind(inputtext, "m") ||
			~strfind(inputtext, "(") || ~strfind(inputtext, ")") || ~strfind(inputtext, ".") || ~strfind(inputtext, "%")) return ShowPlayerDialog(playerid, EDITDB_8_8, DIALOG_STYLE_INPUT,"{ff0000}[!]","{ff0000}Vui long nhap so dien thoai bang so.","Chap nhan","Thoat");

			PlayerInfo[playerid][pSDT8] = sdtdanhba;

			format(string, sizeof(string), "UPDATE `accounts` SET `SDT8`=%d WHERE `id` = %d",number_format(sdtdanhba), GetPlayerSQLId(playerid));
			mysql_function_query(MainPipeline, string, false, "OnQueryFinish", "ii", SENDDATA_THREAD, playerid);

			format(string, sizeof(string), "Ban da them thanh cong so dien thoai %d duoi ten %s.",PlayerInfo[playerid][pSDT8], PlayerInfo[playerid][pDanhBa8]);
			SendClientMessageEx(playerid, COLOR_YELLOW, string);
		}
    }

    //________________________________________________________________________//
	if(dialogid == DANHBA_9)
    {
        if(response)
        {
            if(listitem == 0){ // GOI
				if(PlayerInfo[playerid][pSDT9] != 0){
				    new str[2460], str1[1280], str2[1280], str3[1280], str4[1280], name[1280];
					format(str1, sizeof(str), "THONG TIN CUOC GOI : ");
				    format(str2, sizeof(str), "    -> Ten nguoi nhan : %s", PlayerInfo[playerid][pDanhBa9]);
				    format(str3, sizeof(str), "    -> SDT : %d", PlayerInfo[playerid][pSDT9]);
				    format(str4, sizeof(str), "Neu ban muon goi dien cho nguoi nay, vui long nhan 'Goi ngay' de bat dau cuoc goi");
				    format(str, sizeof(str), "%s\n\n%s\n%s\n%s", str1,str2,str3,str4);
				    format(name, sizeof(name), "DIEN THOAI");
					ShowPlayerDialog(playerid, GOIDIEN_9, DIALOG_STYLE_MSGBOX, name, str, "Goi ngay", "Huy Bo");
					return 1;
				}else ShowPlayerDialog(playerid, DIALOG_NOTHING, DIALOG_STYLE_MSGBOX, "DIEN THOAI","Hien tai danh ba nay van dang con trong , ban vui long them nguoi than vao danh ba slot nay de goi dien...","Dong y", "");
            }
            if(listitem == 1){ // NHAN TIN
				if(PlayerInfo[playerid][pSDT9] != 0){
				    ShowPlayerDialog(playerid, NHANTIN_9, DIALOG_STYLE_INPUT, "Nhan tin", "Vui long nhap tin nhan", "Gui", "Huy");
				    return 1;
				}else ShowPlayerDialog(playerid, DIALOG_NOTHING, DIALOG_STYLE_MSGBOX, "DIEN THOAI","Hien tai danh ba nay van dang con trong , ban vui long them nguoi than vao danh ba slot nay de nhan tin...","Dong y", "");
            }
            if(listitem == 2){ // EDIT DANH BA
                ShowPlayerDialog(playerid, EDITDB_9, DIALOG_STYLE_INPUT, "Them/Sua so dien thoai", "Vui long dien ten hien thi", "Tiep Tuc", "Tro lai");
                return 1;
			}
			if(listitem == 3){ // XOA DANH BA
	            PlayerInfo[playerid][pSDT9] = 0;
	            format(PlayerInfo[playerid][pDanhBa9], 32, "None");
	            SendClientMessageEx(playerid, COLOR_YELLOW, "Ban da xoa danh ba thanh cong !.");
			}
			if(listitem == 4) { // SHOW CHUYEN TIEN
			    ShowChuyenTien(playerid);
			}
        }
	}

	if(dialogid == GOIDIEN_9)
    {
        if(response){
            new phonenumb = PlayerInfo[playerid][pSDT9];
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
			if(PlayerInfo[playerid][pPnumber] == 0)
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong co dien thoai.");
				return 1;
			}
			if(PhoneOnline[playerid] > 0)
			{
				SendClientMessageEx(playerid, COLOR_GREY, "Dien thoai cua ban dang tat.");
				return 1;
			}
			if(GetPVarType(playerid, "PlayerCuffed") || GetPVarType(playerid, "Injured") || GetPVarType(playerid, "IsFrozen")) {
		   		return SendClientMessage(playerid, COLOR_GRAD2, "Ban khong the lam dieu do vao luc nay!");
			}
			format(string, sizeof(string), "* %s lay dien thoai di dong tu tui quan ra.", GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			if(phonenumb == PlayerInfo[playerid][pPnumber])
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "  Dien thoai nguoi do dang ban...");
				return 1;
			}
			if(Mobile[playerid] != INVALID_PLAYER_ID)
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "  Ban dang co mot cuoc goi...");
				return 1;
			}

			foreach(new i: Player)
			{
				if(PlayerInfo[i][pPnumber] == phonenumb && phonenumb != 0)
				{
					new giveplayerid = i;
					Mobile[playerid] = giveplayerid; //caller connecting
					if(IsPlayerConnected(giveplayerid))
					{
						if(giveplayerid != INVALID_PLAYER_ID)
						{
							if(PhoneOnline[giveplayerid] > 0)
							{
								SendClientMessageEx(playerid, COLOR_GREY, "Dien thoai nguoi do dang tat.");
								Mobile[playerid] = INVALID_PLAYER_ID;
								return 1;
							}
							if(Mobile[giveplayerid] != INVALID_PLAYER_ID)
							{
								SendClientMessageEx(playerid, COLOR_GRAD2, "Dien thoai nguoi do dang ban...");
								Mobile[playerid] = INVALID_PLAYER_ID;
								return 1;
							}
							if(Spectating[giveplayerid]!=0)
							{
								SendClientMessageEx(playerid, COLOR_GRAD2, "Dien thoai nguoi do dang ban...");
								Mobile[playerid] = INVALID_PLAYER_ID;
								return 1;
							}
							if (Mobile[giveplayerid] == INVALID_PLAYER_ID)
							{
								format(string, sizeof(string), "Dien thoai di dong cua ban dang vang len - su dung /p de tra loi. [Nguoi goi ID: %s]", GetPlayerNameEx(playerid));
								SendClientMessageEx(giveplayerid, COLOR_YELLOW, string);
								RingTone[giveplayerid] = 10;
								format(string, sizeof(string), "* %s's dien thoai dang do chuong.", GetPlayerNameEx(i));
								SendClientMessageEx(playerid, COLOR_WHITE, "HINT: Bay gio ban co the bam T de tra loi cuoc goi, hoac /h de tat cuoc goi.");
								ProxDetector(30.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
								new Float:rX, Float:rY, Float:rZ;
								GetPlayerPos(giveplayerid, rX, rY, rZ);
								CellTime[playerid] = 1;
								SetPlayerAttachedObject(playerid, 9, 330, 6);
								return SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
							}
						}
					}
				}
			}
        }
    }

    if(dialogid == NHANTIN_9)
    {
       if(response)
       {
			new phonenumb = PlayerInfo[playerid][pSDT9];
    	    if(Spectating[playerid] == 0)
			{
				format(string, sizeof(string), "* %s lay dien thoai di dong tu trong tui quan.", GetPlayerNameEx(playerid));
				ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			}
			if(phonenumb == 555)
			{
				if ((strcmp("yes", inputtext, true, strlen(inputtext)) == 0) && (strlen(inputtext) == strlen("yes")))
				{
					SendClientMessageEx(playerid, COLOR_WHITE, "Tin nhan van ban.");
					SendClientMessageEx(playerid, COLOR_YELLOW, "SMS: Toi dang theo doi ban, Sender: MOLE (555)");
					RingTone[playerid] = 20;
					return 1;
				}
				else
				{
					SendClientMessageEx(playerid, COLOR_YELLOW, "SMS: Toi dang theo doi ban, Sender: MOLE (555)");
					RingTone[playerid] = 20;
					return 1;
				}
			}
			foreach(new i: Player)
			{
				if(PlayerInfo[i][pPnumber] == phonenumb && phonenumb != 0)
				{
					new giveplayerid = i;
					if(Mobile[giveplayerid] != INVALID_PLAYER_ID)
					{
						SendClientMessageEx(playerid, COLOR_GREY, "Dien thoai cua nguoi do dang ban.");
						return 1;
					}
					Mobile[playerid] = giveplayerid; //caller connecting
					if(IsPlayerConnected(giveplayerid))
					{
						if(giveplayerid != INVALID_PLAYER_ID)
						{

							if(PhoneOnline[giveplayerid] > 0)
							{
								SendClientMessageEx(playerid, COLOR_GREY, "Dien thoai cua nguoi do dang tat.");
								Mobile[playerid] = INVALID_PLAYER_ID;
								return 1;
							}
							foreach(new u: Player)
				    		{
				        		if(GetPVarInt(u, "BigEar") == 6 && (GetPVarInt(u, "BigEarPlayer") == playerid || GetPVarInt(u, "BigEarPlayer") == giveplayerid))
				        		{
		       						format(string, sizeof(string), "(BE) %s SMS cho %s: %s", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid), inputtext);
									SendClientMessageEx(u,COLOR_YELLOW, string);
								}
							}
							if(PlayerInfo[playerid][pPhonePrivacy] == 1)
							{
								format(string, sizeof(string), "SMS: %s, Nguoi gui: Khong biet.", inputtext, GetPlayerNameEx(playerid));
							}
							else
							{
								format(string, sizeof(string), "SMS: %s, Nguoi gui: %s (%d)", inputtext, GetPlayerNameEx(playerid), PlayerInfo[playerid][pPnumber]);
							}

							if(i != playerid)
							{
								if(PlayerInfo[i][pSmslog] > 0)
								{
									new query[384], ftext[128];
									mysql_escape_string(inputtext, ftext);
									if(PlayerInfo[playerid][pPhonePrivacy] == 1) format(query, sizeof(query), "INSERT INTO `sms` (`id`, `sender`, `senderid`, `sendernumber`, `receiver`, `receiverid`, `receivernumber`, `message`, `date`) VALUES (NULL, '%s', %d, 0, '%s', %d, %d, '%s', NOW())", GetPlayerNameExt(playerid), GetPlayerSQLId(playerid), GetPlayerNameExt(i), GetPlayerSQLId(i), phonenumb, ftext);
									else format(query, sizeof(query), "INSERT INTO `sms` (`id`, `sender`, `senderid`, `sendernumber`, `receiver`, `receiverid`, `receivernumber`, `message`, `date`) VALUES (NULL, '%s', %d, %d, '%s', %d, %d, '%s', NOW())", GetPlayerNameExt(playerid), GetPlayerSQLId(playerid), PlayerInfo[playerid][pPnumber], GetPlayerNameExt(i), GetPlayerSQLId(i), phonenumb, ftext);
									mysql_function_query(MainPipeline, query, false, "OnQueryFinish", "i", SENDDATA_THREAD);
								}
							}

							RingTone[giveplayerid] =20;
							SendClientMessageEx(giveplayerid, COLOR_YELLOW, string);
							SendClientMessageEx(playerid, COLOR_YELLOW, string);
							SendClientMessageEx(playerid, COLOR_WHITE, "Gui tin nhan van ban");
							Mobile[playerid] = INVALID_PLAYER_ID;

							if(strcmp(PlayerInfo[giveplayerid][pAutoTextReply], "Nothing", true) != 0)
							{
								format(string, sizeof(string), "SMS: %s, Nguoi gui: %s [automated response] (%d)", PlayerInfo[giveplayerid][pAutoTextReply], GetPlayerNameEx(giveplayerid), PlayerInfo[giveplayerid][pPnumber]);
								SendClientMessageEx(playerid, COLOR_YELLOW, string);
							}

							return 1;
						}
					}
				}
			}
			SendClientMessageEx(playerid, COLOR_GRAD2, "  Gui tin nhan that bai...");
       }
    }

    if(dialogid == EDITDB_9)
    {
        if(response)
		{
			strmid(PlayerInfo[playerid][pDanhBa9], inputtext, 0, strlen(inputtext), 128);
			format(string, sizeof(string), "UPDATE `accounts` SET `DanhBa9`='%s' WHERE `id`=%d", inputtext, GetPlayerSQLId(playerid));
			mysql_function_query(MainPipeline, string, false, "OnQueryFinish", "i", SENDDATA_THREAD);
			ShowPlayerDialog(playerid, EDITDB_9_9, DIALOG_STYLE_INPUT, "Them/Sua so dien thoai", "Vui long dien so dien thoai", "Tiep Tuc", "Tro lai");
        }
	}

	if(dialogid == EDITDB_9_9)
    {
		if(response)
		{
			new sdtdanhba = strval(inputtext);

			if(~strfind(inputtext, ";") || ~strfind(inputtext, ",") || ~strfind(inputtext, "'") || ~strfind(inputtext, ":") ||
			~strfind(inputtext, "|") || ~strfind(inputtext, "{") || ~strfind(inputtext, "}") || ~strfind(inputtext, "+") ||
			~strfind(inputtext, "?") || ~strfind(inputtext, "/")  || ~strfind(inputtext, " ") ||
			~strfind(inputtext, "@") || ~strfind(inputtext, "[") || ~strfind(inputtext, "]") || ~strfind(inputtext, "<") ||
			~strfind(inputtext, ">") || ~strfind(inputtext, "!") || ~strfind(inputtext, "#") || ~strfind(inputtext, "^") ||
			~strfind(inputtext, "*") || ~strfind(inputtext, "&") || ~strfind(inputtext, "q") || ~strfind(inputtext, "w") ||
			~strfind(inputtext, "e") || ~strfind(inputtext, "r") || ~strfind(inputtext, "t") || ~strfind(inputtext, "y") ||
			~strfind(inputtext, "u") || ~strfind(inputtext, "i") || ~strfind(inputtext, "o") || ~strfind(inputtext, "p") ||
			~strfind(inputtext, "a") || ~strfind(inputtext, "s") || ~strfind(inputtext, "d") || ~strfind(inputtext, "f") ||
			~strfind(inputtext, "g") || ~strfind(inputtext, "h") || ~strfind(inputtext, "j") || ~strfind(inputtext, "k") ||
			~strfind(inputtext, "l") || ~strfind(inputtext, "z") || ~strfind(inputtext, "x") || ~strfind(inputtext, "c") ||
			~strfind(inputtext, "v") || ~strfind(inputtext, "b") || ~strfind(inputtext, "n") || ~strfind(inputtext, "m") ||
			~strfind(inputtext, "(") || ~strfind(inputtext, ")") || ~strfind(inputtext, ".") || ~strfind(inputtext, "%")) return ShowPlayerDialog(playerid, EDITDB_9_9, DIALOG_STYLE_INPUT,"{ff0000}[!]","{ff0000}Vui long nhap so dien thoai bang so.","Chap nhan","Thoat");

			PlayerInfo[playerid][pSDT9] = sdtdanhba;

			format(string, sizeof(string), "UPDATE `accounts` SET `SDT9`=%d WHERE `id` = %d",number_format(sdtdanhba), GetPlayerSQLId(playerid));
			mysql_function_query(MainPipeline, string, false, "OnQueryFinish", "ii", SENDDATA_THREAD, playerid);

			format(string, sizeof(string), "Ban da them thanh cong so dien thoai %d duoi ten %s.",PlayerInfo[playerid][pSDT9], PlayerInfo[playerid][pDanhBa9]);
			SendClientMessageEx(playerid, COLOR_YELLOW, string);
		}
    }
	return 1;
}

