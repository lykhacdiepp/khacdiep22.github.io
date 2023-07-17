#include <td-actions>

CMD:thuexe(playerid)
{
    if(IsPlayerInRangeOfPoint(playerid, 4, -2640.9512, 614.0588, 14.4531) || IsPlayerInRangeOfPoint(playerid, 4, -1710.0415, 1336.1165, 7.1843))
	{
	ShowActionForPlayer(playerid, ActionThuexe, "ban co muon mot chiec xe dap khong??", .action_time = 10000);
	}
	else
	{
	    SendClientMessageEx(playerid, COLOR_GREY, "Ban khong o vi tri thue xe,/vitrithuexe de biet vi tri.");
	}
	return 1;
}

Action:ActionThuexe(playerid, response)
{
	if (response == ACTION_RESPONSE_YES)
	{
		new Float:x, Float:y, Float:z, Float:ang;

		GetPlayerPos(playerid, x, y, z);
		GetPlayerFacingAngle(playerid, ang);
		
//       if(IsPlayerInRangeOfPoint(playerid, 4, 1102.8999, -1440.1669, 15.7969) || IsPlayerInRangeOfPoint(playerid, 4, 1796.0620, -1588.5571, 13.4951))

		new vehicleid = CreateVehicle(481,
			x + 2.5 * floatsin(-ang, degrees),
			y + 2.5 * floatcos(-ang, degrees),
			z + 0.3,
			ang,
			0,
			0,
			-1);

		LinkVehicleToInterior(vehicleid, GetPlayerInterior(playerid));
		SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));
	} else {
		SendClientMessage(playerid, -1, "chiec xe dap da duoc spawn.");
	}
}
