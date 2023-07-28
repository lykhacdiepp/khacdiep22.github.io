// Speedo by #Dylan<\>
#include <a_samp>
#include <YSI\y_hooks>

new PlayerText:TDSpeedo[MAX_PLAYERS][5];

stock GetVehicleSpeed(vehicleid)
{
    new
        Float:vel[3],
        Float:tempspeed;
    GetVehicleVelocity(vehicleid, vel[0], vel[1], vel[2]);
    tempspeed = floatsqroot((vel[0] * vel[0]) + (vel[1] * vel[1]) + (vel[2] * vel[2])) * 136.666667;
    return floatround(tempspeed, floatround_round);
}

hook OnPlayerUpdate(playerid)
{
    if(IsPlayerInAnyVehicle(playerid))
    {
        new speed[1280], fuelcc[1280];
        new vspeed;
        vspeed = GetVehicleSpeed(GetPlayerVehicleID(playerid));
        format(speed, sizeof(speed), "%d", vspeed);
        PlayerTextDrawSetString(playerid, TDSpeedo[playerid][0], speed);
        new iVehicleID = GetPlayerVehicleID(playerid);
        format(fuelcc, sizeof(fuelcc), "%.0f.00", VehicleFuel[iVehicleID]);
        PlayerTextDrawSetString(playerid, TDSpeedo[playerid][3], fuelcc);
    }
    return 1;
}

hook OnPlayerStateChange(playerid, newstate, oldstate)
{
    if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
    {
        PlayerTextDrawShow(playerid, TDSpeedo[playerid][0]);
        PlayerTextDrawShow(playerid, TDSpeedo[playerid][1]);
        PlayerTextDrawShow(playerid, TDSpeedo[playerid][2]);
        PlayerTextDrawShow(playerid, TDSpeedo[playerid][3]);
	    PlayerTextDrawShow(playerid, TDSpeedo[playerid][4]);
    }else{
        PlayerTextDrawHide(playerid, TDSpeedo[playerid][0]);
	    PlayerTextDrawHide(playerid, TDSpeedo[playerid][1]);
	    PlayerTextDrawHide(playerid, TDSpeedo[playerid][2]);
        PlayerTextDrawHide(playerid, TDSpeedo[playerid][3]);
	    PlayerTextDrawHide(playerid, TDSpeedo[playerid][4]);	    
    }
    return 1;
}

hook OnPlayerConnect(playerid) {
	TDSpeedo[playerid][0] = CreatePlayerTextDraw(playerid, 463.000, 325.000, "100");
	PlayerTextDrawLetterSize(playerid, TDSpeedo[playerid][0], 0.339, 1.500);
	PlayerTextDrawTextSize(playerid, TDSpeedo[playerid][0], 0.000, 21.000);
	PlayerTextDrawAlignment(playerid, TDSpeedo[playerid][0], 2);
	PlayerTextDrawColor(playerid, TDSpeedo[playerid][0], -65281);
	PlayerTextDrawUseBox(playerid, TDSpeedo[playerid][0], 1);
	PlayerTextDrawBoxColor(playerid, TDSpeedo[playerid][0], 150);
	PlayerTextDrawSetShadow(playerid, TDSpeedo[playerid][0], 1);
	PlayerTextDrawSetOutline(playerid, TDSpeedo[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, TDSpeedo[playerid][0], 150);
	PlayerTextDrawFont(playerid, TDSpeedo[playerid][0], 3);
	PlayerTextDrawSetProportional(playerid, TDSpeedo[playerid][0], 1);

	TDSpeedo[playerid][1] = CreatePlayerTextDraw(playerid, 486.000, 343.000, "-----------");
	PlayerTextDrawLetterSize(playerid, TDSpeedo[playerid][1], -0.210, -0.200);
	PlayerTextDrawAlignment(playerid, TDSpeedo[playerid][1], 1);
	PlayerTextDrawColor(playerid, TDSpeedo[playerid][1], -1);
	PlayerTextDrawSetShadow(playerid, TDSpeedo[playerid][1], 1);
	PlayerTextDrawSetOutline(playerid, TDSpeedo[playerid][1], 1);
	PlayerTextDrawBackgroundColor(playerid, TDSpeedo[playerid][1], 150);
	PlayerTextDrawFont(playerid, TDSpeedo[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, TDSpeedo[playerid][1], 1);

	TDSpeedo[playerid][2] = CreatePlayerTextDraw(playerid, 484.000, 328.000, "KM");
	PlayerTextDrawLetterSize(playerid, TDSpeedo[playerid][2], 0.310, 1.399);
	PlayerTextDrawTextSize(playerid, TDSpeedo[playerid][2], 3.000, 0.000);
	PlayerTextDrawAlignment(playerid, TDSpeedo[playerid][2], 2);
	PlayerTextDrawColor(playerid, TDSpeedo[playerid][2], 16777215);
	PlayerTextDrawSetShadow(playerid, TDSpeedo[playerid][2], 1);
	PlayerTextDrawSetOutline(playerid, TDSpeedo[playerid][2], 1);
	PlayerTextDrawBackgroundColor(playerid, TDSpeedo[playerid][2], 150);
	PlayerTextDrawFont(playerid, TDSpeedo[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, TDSpeedo[playerid][2], 1);

	TDSpeedo[playerid][3] = CreatePlayerTextDraw(playerid, 478.000, 341.000, "100.00");
	PlayerTextDrawLetterSize(playerid, TDSpeedo[playerid][3], 0.220, 0.999);
	PlayerTextDrawAlignment(playerid, TDSpeedo[playerid][3], 2);
	PlayerTextDrawColor(playerid, TDSpeedo[playerid][3], -2686721);
	PlayerTextDrawSetShadow(playerid, TDSpeedo[playerid][3], 1);
	PlayerTextDrawSetOutline(playerid, TDSpeedo[playerid][3], 1);
	PlayerTextDrawBackgroundColor(playerid, TDSpeedo[playerid][3], 150);
	PlayerTextDrawFont(playerid, TDSpeedo[playerid][3], 3);
	PlayerTextDrawSetProportional(playerid, TDSpeedo[playerid][3], 1);

	TDSpeedo[playerid][4] = CreatePlayerTextDraw(playerid, 499.000, 340.000, "ML");
	PlayerTextDrawLetterSize(playerid, TDSpeedo[playerid][4], 0.270, 1.199);
	PlayerTextDrawTextSize(playerid, TDSpeedo[playerid][4], 3.000, 0.000);
	PlayerTextDrawAlignment(playerid, TDSpeedo[playerid][4], 2);
	PlayerTextDrawColor(playerid, TDSpeedo[playerid][4], 16777215);
	PlayerTextDrawSetShadow(playerid, TDSpeedo[playerid][4], 1);
	PlayerTextDrawSetOutline(playerid, TDSpeedo[playerid][4], 1);
	PlayerTextDrawBackgroundColor(playerid, TDSpeedo[playerid][4], 150);
	PlayerTextDrawFont(playerid, TDSpeedo[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, TDSpeedo[playerid][4], 1);
	return 1;
}

hook OnPlayerExitVehicle(playerid, vehicleid)
{
    PlayerTextDrawShow(playerid, TDSpeedo[playerid][0]);
    PlayerTextDrawShow(playerid, TDSpeedo[playerid][1]);
    PlayerTextDrawShow(playerid, TDSpeedo[playerid][2]);
    PlayerTextDrawHide(playerid, TDSpeedo[playerid][3]);
    PlayerTextDrawHide(playerid, TDSpeedo[playerid][4]);
    return 1;
}
