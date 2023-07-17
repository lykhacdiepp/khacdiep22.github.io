// -------- Cong viec giao hang vietnamse ------ 
// -------- Nguyễn Thanh Vĩ ------
// -------- Facebook.com/ntv.god -----
// -------- Hotline:039.515.2362 -----
// -------- cộng đồng máy chủ mobile -----

#include <a_samp>
#include <ysi\y_hooks>
hook OnGameModeInit()
{
	CreateActor(24,-1316.7323,2700.7727,50.2663,210.8296); // NPCXinviec
	CreateDynamic3DTextLabel("{33CCCC}NPC\n{FF3333}Cong Viec Giao Hang\nBam Y", COLOR_YELLOW, -1316.7323,2700.7727,50.2663+0.6,18.0);
	CreateDynamic3DTextLabel("{33CCCC}Vi Tri\n{FF3333}Hay bat dau mot cong viec giao hang\n/batdaulamviec", COLOR_YELLOW, -1289.8882,2718.3303,50.1952+0.6,18.0);
}

stock IsAGiaoHang1Car(carid)
{
	for (new v = 0; v < sizeof(GiaoHang1Vehicles); v++) {
	    if(carid == GiaoHang1Vehicles[v]) return 1;
	}
	return 0;
}

new bool:Vitricp[MAX_PLAYERS] = false;
//gaiohang

CMD:batdaulamviec(playerid, params[]) {

	if(PlayerInfo[playerid][pJob] != 22 && PlayerInfo[playerid][pJob2] != 22) {
	if(Vitricp[playerid] == false) {
	if(IsPlayerInRangeOfPoint(playerid, 2.0, -1289.8882,2718.3303,50.1952)) {
	if(IsAGiaoHang1Car(GetPlayerVehicleID(playerid))) {
	SetPlayerCheckpoint(playerid, -832.3063,1482.8256,18.3706, 5.0);
	SendClientMessage(playerid, COLOR_YELLOW, "Ban Da bat dau lam viec hay den vi tri cham do va lay hang");
	}
	else SendClientMessage(playerid, COLOR_GREY, "Ban o tren phuong tien cua cong ty moi co the thuc hien");
	}
	else SendClientMessage(playerid, COLOR_GREY, "Ban khong o vi tri bat dau cong viec nen khong the thuc hien");
	}
	}
	else SendClientMessage(playerid, COLOR_GREY, "Ban chua nhan cong viec");
	return 1;
}

hook OnPlayerEnterCheckpoint(playerid)
{
	if(Vitricp[playerid] == true)
	{	
		if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 400) {	
		DisablePlayerCheckpoint(playerid);
		Vitricp[playerid] = false;
		SendClientMessage(playerid, COLOR_YELLOW, "Ban da thuc hien mot chuyen hang va nhan duoc so tien 10500$ - 120 Vat lieu");
		SendClientMessage(playerid, COLOR_YELLOW, "Neu ban quen duong ve hay /timvieclam");
		PlayerInfo[playerid][pCash] += 10500; // don vi 12k tien
		PlayerInfo[playerid][pMats] += 120;
		}
		else SendClientMessage(playerid, COLOR_GREY, "day la khong phai phuong tien cua cong ty");
	}
	return 1;
}

  

