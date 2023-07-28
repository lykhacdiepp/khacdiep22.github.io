#include <YSI\y_hooks>

static	LSPDVehicles[12],
		LSFMDVehicles[10];


stock KiemTraXeCanhSat(carid)
{
	for(new v = 0; v < sizeof(LSPDVehicles); v++) {
	    if(carid == LSPDVehicles[v]) return 1;
	}
	return 0;
}

stock KiemTraXeCuuThuong(carid)
{
	for(new v = 0; v < sizeof(LSFMDVehicles); v++) {
	    if(carid == LSFMDVehicles[v]) return 1;
	}
	return 0;
}

hook OnGameModeInit()  
{
	static string[32];
	LSFMDVehicles[0] = AddStaticVehicleEx(416,2055.62,-1417.93,48.54,180.47,1,3,VEHICLE_RESPAWN);
	LSFMDVehicles[1] = AddStaticVehicleEx(416,2060.32,-1417.92,48.45,180.05,1,3,VEHICLE_RESPAWN);
	LSFMDVehicles[2] = AddStaticVehicleEx(416,2064.07,-1417.43,48.45,179.33,1,3,VEHICLE_RESPAWN);
	LSFMDVehicles[3] = AddStaticVehicleEx(416,2068.09,-1416.81,48.52,179.33,1,3,VEHICLE_RESPAWN);
	LSFMDVehicles[4] = AddStaticVehicleEx(416,2071.62,-1416.43,48.43,181.72,1,3,VEHICLE_RESPAWN);
	LSFMDVehicles[5] = AddStaticVehicleEx(416,1126.06,-1329.68,13.31,0.66,1,3,VEHICLE_RESPAWN);
	LSFMDVehicles[6] = AddStaticVehicleEx(416,1109.27,-1330.13,13.3,0.18,1,3,VEHICLE_RESPAWN);
	LSFMDVehicles[7] = AddStaticVehicleEx(416,1113.31,-1330.05,13.3,0.68,1,3,VEHICLE_RESPAWN);
	LSFMDVehicles[8] = AddStaticVehicleEx(416,1121.56,-1329.68,13.31,359.92,1,3,VEHICLE_RESPAWN);
	LSFMDVehicles[9] = AddStaticVehicleEx(416,1095.43,-1330.06,13.3,359.42,1,3,VEHICLE_RESPAWN);
	for(new lsfmdveh;lsfmdveh<sizeof(LSFMDVehicles);lsfmdveh++)
	{
	    format(string, sizeof(string), "LSFMD %d", LSFMDVehicles[lsfmdveh]);
	    SetVehicleNumberPlate(LSFMDVehicles[lsfmdveh], string);
	}	



	LSPDVehicles[0] = AddStaticVehicleEx(525,1585.04,-1667.43,5.76,270.13,0,1,VEHICLE_RESPAWN);
	LSPDVehicles[1] = AddStaticVehicleEx(523,1583.68,-1676.43,5.46,268.07,0,1,VEHICLE_RESPAWN);
	LSPDVehicles[2] = AddStaticVehicleEx(427,1595.56,-1710.52,6.01,1.47,0,1,VEHICLE_RESPAWN);
	LSPDVehicles[3] = AddStaticVehicleEx(523,1583.68,-1679.52,5.46,269.72,0,1,VEHICLE_RESPAWN);
	LSPDVehicles[4] = AddStaticVehicleEx(596,1602.43,-1683.79,5.61,90.12,0,1,VEHICLE_RESPAWN);
	LSPDVehicles[5] = AddStaticVehicleEx(596,1602.31,-1688.02,5.61,87.44,0,1,VEHICLE_RESPAWN);
	LSPDVehicles[6] = AddStaticVehicleEx(490,1578.68,-1711.63,6.01,1.5,0,1,VEHICLE_RESPAWN);
	LSPDVehicles[7] = AddStaticVehicleEx(528,1545.53,-1684.31,5.92,90.87,0,1,VEHICLE_RESPAWN);
	LSPDVehicles[8] = AddStaticVehicleEx(601,1545.3,-1650.81,5.65,90.87,0,1,VEHICLE_RESPAWN);
	LSPDVehicles[9] = AddStaticVehicleEx(599,1529.56,-1688,6.07,269.45,0,1,VEHICLE_RESPAWN);
	LSPDVehicles[10] = AddStaticVehicleEx(497,1566.31,-1650.91,28.54,87.91,0,1,VEHICLE_RESPAWN);
	LSPDVehicles[11] = AddStaticVehicleEx(497,1567.29,-1698.18,28.54,90.05,0,1,VEHICLE_RESPAWN);
	for(new lspdveh;lspdveh<sizeof(LSPDVehicles);lspdveh++)
	{
	    format(string, sizeof(string), "LSPD %d", LSPDVehicles[lspdveh]);
	    SetVehicleNumberPlate(LSPDVehicles[lspdveh], string);
	}	






	/*
	VehName[ID_Numb] = AddStaticVehicleEx(ID_Car,x,y,z,rot,color_1,color_2,VEHICLE_RESPAWN);
	VehName[ID_Numb] = AddStaticVehicleEx(ID_Car,x,y,z,rot,color_1,color_2,VEHICLE_RESPAWN);
	VehName[ID_Numb] = AddStaticVehicleEx(ID_Car,x,y,z,rot,color_1,color_2,VEHICLE_RESPAWN);
	VehName[ID_Numb] = AddStaticVehicleEx(ID_Car,x,y,z,rot,color_1,color_2,VEHICLE_RESPAWN);
	VehName[ID_Numb] = AddStaticVehicleEx(ID_Car,x,y,z,rot,color_1,color_2,VEHICLE_RESPAWN);
	VehName[ID_Numb] = AddStaticVehicleEx(ID_Car,x,y,z,rot,color_1,color_2,VEHICLE_RESPAWN);
	VehName[ID_Numb] = AddStaticVehicleEx(ID_Car,x,y,z,rot,color_1,color_2,VEHICLE_RESPAWN);
	VehName[ID_Numb] = AddStaticVehicleEx(ID_Car,x,y,z,rot,color_1,color_2,VEHICLE_RESPAWN);
	VehName[ID_Numb] = AddStaticVehicleEx(ID_Car,x,y,z,rot,color_1,color_2,VEHICLE_RESPAWN);
	VehName[ID_Numb] = AddStaticVehicleEx(ID_Car,x,y,z,rot,color_1,color_2,VEHICLE_RESPAWN);
	VehName[ID_Numb] = AddStaticVehicleEx(ID_Car,x,y,z,rot,color_1,color_2,VEHICLE_RESPAWN);
	VehName[ID_Numb] = AddStaticVehicleEx(ID_Car,x,y,z,rot,color_1,color_2,VEHICLE_RESPAWN);
	VehName[ID_Numb] = AddStaticVehicleEx(ID_Car,x,y,z,rot,color_1,color_2,VEHICLE_RESPAWN);
	VehName[ID_Numb] = AddStaticVehicleEx(ID_Car,x,y,z,rot,color_1,color_2,VEHICLE_RESPAWN);
	VehName[ID_Numb] = AddStaticVehicleEx(ID_Car,x,y,z,rot,color_1,color_2,VEHICLE_RESPAWN);
	VehName[ID_Numb] = AddStaticVehicleEx(ID_Car,x,y,z,rot,color_1,color_2,VEHICLE_RESPAWN);
	VehName[ID_Numb] = AddStaticVehicleEx(ID_Car,x,y,z,rot,color_1,color_2,VEHICLE_RESPAWN);
	VehName[ID_Numb] = AddStaticVehicleEx(ID_Car,x,y,z,rot,color_1,color_2,VEHICLE_RESPAWN);
	VehName[ID_Numb] = AddStaticVehicleEx(ID_Car,x,y,z,rot,color_1,color_2,VEHICLE_RESPAWN);
	VehName[ID_Numb] = AddStaticVehicleEx(ID_Car,x,y,z,rot,color_1,color_2,VEHICLE_RESPAWN);
	VehName[ID_Numb] = AddStaticVehicleEx(ID_Car,x,y,z,rot,color_1,color_2,VEHICLE_RESPAWN);
	VehName[ID_Numb] = AddStaticVehicleEx(ID_Car,x,y,z,rot,color_1,color_2,VEHICLE_RESPAWN);
	VehName[ID_Numb] = AddStaticVehicleEx(ID_Car,x,y,z,rot,color_1,color_2,VEHICLE_RESPAWN);
	*/
	return 0;
}


hook OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	if(!ispassenger)
	{
		if(KiemTraXeCanhSat(vehicleid))
		{
	  		if((0 <= PlayerInfo[playerid][pMember] < MAX_GROUPS) && (arrGroupData[PlayerInfo[playerid][pMember]][g_iGroupType] == 1 || arrGroupData[PlayerInfo[playerid][pLeader]][g_iGroupType] == 1))
	  		{
			}
			else
			{
		  		RemovePlayerFromVehicle(playerid);
		  		new Float:slx, Float:sly, Float:slz;
				GetPlayerPos(playerid, slx, sly, slz);
				SetPlayerPos(playerid, slx, sly, slz);
		  		defer NOPCheck(playerid);
			 	SendClientMessageEx(playerid,COLOR_GREY,"Ban khong phai canh sat!");
	  		}
		}
		else if(KiemTraXeCuuThuong(vehicleid))
		{
	  		if((0 <= PlayerInfo[playerid][pMember] < MAX_GROUPS) && (arrGroupData[PlayerInfo[playerid][pMember]][g_iGroupType] == 3 || arrGroupData[PlayerInfo[playerid][pLeader]][g_iGroupType] == 3))
	  		{
			}
			else
			{
		  		RemovePlayerFromVehicle(playerid);
		  		new Float:slx, Float:sly, Float:slz;
				GetPlayerPos(playerid, slx, sly, slz);
				SetPlayerPos(playerid, slx, sly, slz);
		  		defer NOPCheck(playerid);
			 	SendClientMessageEx(playerid,COLOR_GREY,"Ban khong phai cuu thuong!");
	  		}
		}		
	}
}