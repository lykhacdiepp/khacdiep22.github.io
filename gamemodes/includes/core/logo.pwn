// Logo by #Dylan<\>
#include <a_samp>
#include <YSI\y_hooks>


new PlayerText: LogoPNSA[MAX_PLAYERS][6];


    hook OnPlayerConnect(playerid)  {
	LogoPNSA[playerid][0] = CreatePlayerTextDraw(playerid, 2.000, 426.000, "Name:");
	PlayerTextDrawLetterSize(playerid, LogoPNSA[playerid][0], 0.170, 0.699);
	PlayerTextDrawAlignment(playerid, LogoPNSA[playerid][0], 1);
	PlayerTextDrawColor(playerid, LogoPNSA[playerid][0], -1);
	PlayerTextDrawSetShadow(playerid, LogoPNSA[playerid][0], 1);
	PlayerTextDrawSetOutline(playerid, LogoPNSA[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, LogoPNSA[playerid][0], 150);
	PlayerTextDrawFont(playerid, LogoPNSA[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, LogoPNSA[playerid][0], 1);

	LogoPNSA[playerid][1] = CreatePlayerTextDraw(playerid, 21.000, 426.000, "Dylan_Code 100");
	PlayerTextDrawLetterSize(playerid, LogoPNSA[playerid][1], 0.170, 0.699);
	PlayerTextDrawAlignment(playerid, LogoPNSA[playerid][1], 1);
	PlayerTextDrawColor(playerid, LogoPNSA[playerid][1], -1);
	PlayerTextDrawSetShadow(playerid, LogoPNSA[playerid][1], 1);
	PlayerTextDrawSetOutline(playerid, LogoPNSA[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, LogoPNSA[playerid][1], 150);
	PlayerTextDrawFont(playerid, LogoPNSA[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, LogoPNSA[playerid][1], 1);

	LogoPNSA[playerid][2] = CreatePlayerTextDraw(playerid, 2.000, 433.000, "JOB:");
	PlayerTextDrawLetterSize(playerid, LogoPNSA[playerid][2], 0.170, 0.699);
	PlayerTextDrawAlignment(playerid, LogoPNSA[playerid][2], 1);
	PlayerTextDrawColor(playerid, LogoPNSA[playerid][2], -1);
	PlayerTextDrawSetShadow(playerid, LogoPNSA[playerid][2], 1);
	PlayerTextDrawSetOutline(playerid, LogoPNSA[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, LogoPNSA[playerid][2], 150);
	PlayerTextDrawFont(playerid, LogoPNSA[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, LogoPNSA[playerid][2], 1);

	/*LogoPNSA[playerid][3] = CreatePlayerTextDraw(playerid, 15.000, 433.000, "none");
	PlayerTextDrawLetterSize(playerid, LogoPNSA[playerid][3], 0.170, 0.699);
	PlayerTextDrawAlignment(playerid, LogoPNSA[playerid][3], 1);
	PlayerTextDrawColor(playerid, LogoPNSA[playerid][3], -1);
	PlayerTextDrawSetShadow(playerid, LogoPNSA[playerid][3], 1);
	PlayerTextDrawSetOutline(playerid, LogoPNSA[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, LogoPNSA[playerid][3], 150);
	PlayerTextDrawFont(playerid, LogoPNSA[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, LogoPNSA[playerid][3], 1);*/

	LogoPNSA[playerid][4] = CreatePlayerTextDraw(playerid, 21.000, 439.000, "VG Community");
	PlayerTextDrawLetterSize(playerid, LogoPNSA[playerid][4], 0.170, 0.799);
	PlayerTextDrawAlignment(playerid, LogoPNSA[playerid][4], 2);
	PlayerTextDrawColor(playerid, LogoPNSA[playerid][4], -1);
	PlayerTextDrawSetShadow(playerid, LogoPNSA[playerid][4], 1);
	PlayerTextDrawSetOutline(playerid, LogoPNSA[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, LogoPNSA[playerid][4], 150);
	PlayerTextDrawFont(playerid, LogoPNSA[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, LogoPNSA[playerid][4], 1);
	return 1;
}

hook OnPlayerUpdate(playerid)   {
	new string[128];
	format(string, sizeof string, "%s (%d)",GetPlayerNameEx(playerid), playerid);
	PlayerTextDrawSetString(playerid, LogoPNSA[playerid][1],string);
	/*format(string, sizeof string, "%d",PlayerInfo[playerid][p]);
	PlayerTextDrawSetString(playerid, LogoPNSA[playerid][3],string);*/
	PlayerTextDrawShow(playerid, LogoPNSA[playerid][0]);
	PlayerTextDrawShow(playerid, LogoPNSA[playerid][1]);
	PlayerTextDrawShow(playerid, LogoPNSA[playerid][2]);
	//PlayerTextDrawShow(playerid, LogoPNSA[playerid][3]);
	PlayerTextDrawShow(playerid, LogoPNSA[playerid][3]);
	PlayerTextDrawShow(playerid, LogoPNSA[playerid][4]);
	return 1;
}
