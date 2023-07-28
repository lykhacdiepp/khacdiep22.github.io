public OnPlayerUpdate(playerid)
{
    new vehicle = GetPlayerVehicleID(playerid);
    if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER && !IsAbicycle(vehicle)) // Making sure the player is in a vehicle as driver
    {
        if(PlayerSpeedo[playerid] == 0)
        {
            new Float:H;
            GetVehicleHealth(vehicle, H);
            new speed[24];
            format(speed, sizeof(speed), "%.0f", GetVehicleSpeed(vehicle));
            PlayerTextDrawSetString(playerid, cWspeedo[playerid][3], speed);
            new vehfuel[24];
            format(vehfuel, sizeof(vehfuel), "%d", carfuel[vehicle]);
            PlayerTextDrawSetString(playerid, cWspeedo[playerid][6], vehfuel); //VehicleFuel[vehicleid]
            new vehiclehealth[24];
            format(vehiclehealth, sizeof(vehiclehealth), "%.0f", H);
            PlayerTextDrawSetString(playerid, cWspeedo[playerid][8], vehiclehealth);
        }
        else if(PlayerSpeedo[playerid] == 1)
        {
            new Float:H;
            GetVehicleHealth(vehicle, H);
            new speed[24];
            format(speed, sizeof(speed), "%.0f", GetVehicleSpeedMPH(vehicle));
            PlayerTextDrawSetString(playerid, cWspeedo[playerid][3], speed);
            new vehfuel[24];
            format(vehfuel, sizeof(vehfuel), "%d", carfuel[vehicle]);
            PlayerTextDrawSetString(playerid, cWspeedo[playerid][6], vehfuel);
            new vehiclehealth[24];
            format(vehiclehealth, sizeof(vehiclehealth), "%.0f", H);
            PlayerTextDrawSetString(playerid, cWspeedo[playerid][8], vehiclehealth);
            PlayerTextDrawSetString(playerid, cWspeedo[playerid][5], "MP/H");
        }
    }
    return 1;
}