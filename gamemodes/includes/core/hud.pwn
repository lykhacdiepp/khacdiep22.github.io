//____________________________________________________________________________//

	//-------------------------------------------------------------------
	//					Code create by #nDP 						   //
	//					Fb.com/nguyenduyphuong.com  			       //
	//					Copyright by nDP" 							   //
	//-------------------------------------------------------------------

//____________________________________________________________________________//

new DoiBung[MAX_PLAYERS] = 100;
new KhatNuoc[MAX_PLAYERS] = 100;

new Text:TD_Hud[18];
new PlayerText:TD_HudPlayer[MAX_PLAYERS][2];
new PlayerBar:TD_HudProgressBar[MAX_PLAYERS][2];

public OnPlayerConnect(playerid)
{
	LoadTextDrawHudPlayer(playerid);
	return 1;
}

public OnGameModeInit() {
	LoadTextDrawHud();
	return 1;
}

CMD:testhud(playerid, params[]) {
	new rand_doibung = random(5);
	new rand_khatnuoc = random(10);

	if(DoiBung[playerid] > 0) {
		DoiBung[playerid] -= rand_doibung;
	}else DoiBung[playerid] = 100;

	if(KhatNuoc[playerid] > 0) {
		KhatNuoc[playerid] -= rand_khatnuoc;
	}else KhatNuoc[playerid] = 100;

	UpdateHud(playerid);
	SendClientMessage(playerid, -1, "Code by nDP")
	return 1;
} 

CMD:hud(playerid, params[]) {
	new info[1280];
	new name[MAX_PLAYER_NAME + 1];
    GetPlayerName(playerid, name, sizeof(name));
	format(info, sizeof(info), "ID: %d - %s", playerid, name);
	PlayerTextDrawSetString(playerid, TD_HudPlayer[playerid][0], info)

	PlayerTextDrawShow(playerid, TD_HudPlayer[playerid][0]);

	new guild[1280];
	format(guild, sizeof(guild), "%s", "HongHung_Family");
	PlayerTextDrawSetString(playerid, TD_HudPlayer[playerid][1], guild)
	PlayerTextDrawShow(playerid, TD_HudPlayer[playerid][1]);

	SetPlayerProgressBarValue(playerid, TD_HudProgressBar[playerid][0], DoiBung[playerid]);
	SetPlayerProgressBarValue(playerid, TD_HudProgressBar[playerid][1], KhatNuoc[playerid]);
	ShowPlayerProgressBar(playerid, TD_HudProgressBar[playerid][0]);
	ShowPlayerProgressBar(playerid, TD_HudProgressBar[playerid][1]);

	for(new i = 0; i < 16; i++)
		TextDrawShowForPlayer(playerid, TD_Hud[i]);
	return 1;
}

stock UpdateHud(playerid) {
	SetPlayerProgressBarValue(playerid, TD_HudProgressBar[playerid][0], DoiBung[playerid]);
	SetPlayerProgressBarValue(playerid, TD_HudProgressBar[playerid][1], KhatNuoc[playerid]);
}

stock LoadTextDrawHudPlayer(playerid) {
	TD_HudPlayer[playerid][0] = CreatePlayerTextDraw(playerid, 131.333404, 354.681610, "ID:_1_-_BE_PHUONG");
	PlayerTextDrawLetterSize(playerid, TD_HudPlayer[playerid][0], 0.154666, 1.069036);
	PlayerTextDrawAlignment(playerid, TD_HudPlayer[playerid][0], 1);
	PlayerTextDrawColor(playerid, TD_HudPlayer[playerid][0], -1);
	PlayerTextDrawSetShadow(playerid, TD_HudPlayer[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, TD_HudPlayer[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, TD_HudPlayer[playerid][0], 255);
	PlayerTextDrawFont(playerid, TD_HudPlayer[playerid][0], 2);
	PlayerTextDrawSetProportional(playerid, TD_HudPlayer[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, TD_HudPlayer[playerid][0], 0);

	TD_HudPlayer[playerid][1] = CreatePlayerTextDraw(playerid, 131.333404, 371.274261, "HongHung_Family");
	PlayerTextDrawLetterSize(playerid, TD_HudPlayer[playerid][1], 0.154666, 1.069036);
	PlayerTextDrawAlignment(playerid, TD_HudPlayer[playerid][1], 1);
	PlayerTextDrawColor(playerid, TD_HudPlayer[playerid][1], -1);
	PlayerTextDrawSetShadow(playerid, TD_HudPlayer[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, TD_HudPlayer[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, TD_HudPlayer[playerid][1], 255);
	PlayerTextDrawFont(playerid, TD_HudPlayer[playerid][1], 2);
	PlayerTextDrawSetProportional(playerid, TD_HudPlayer[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, TD_HudPlayer[playerid][1], 0);

	TD_HudProgressBar[playerid][0] = CreatePlayerProgressBar(playerid, 132.000000, 391.000000, 67.500000, 6.000000, -764862721, 100.000000, 0);

	TD_HudProgressBar[playerid][1] = CreatePlayerProgressBar(playerid, 132.000000, 408.000000, 67.500000, 6.000000, 1097458175, 100.000000, 0);
	return 1;
}
stock LoadTextDrawHud() 
{
	TD_Hud[0] = TextDrawCreate(115.666664, 351.207611, "ld_beat:chit");
	TextDrawLetterSize(TD_Hud[0], 0.000000, 0.000000);
	TextDrawTextSize(TD_Hud[0], 19.000000, 17.000000);
	TextDrawAlignment(TD_Hud[0], 1);
	TextDrawColor(TD_Hud[0], 255);
	TextDrawSetShadow(TD_Hud[0], 0);
	TextDrawSetOutline(TD_Hud[0], 0);
	TextDrawBackgroundColor(TD_Hud[0], 255);
	TextDrawFont(TD_Hud[0], 4);
	TextDrawSetProportional(TD_Hud[0], 0);
	TextDrawSetShadow(TD_Hud[0], 0);

	TD_Hud[1] = TextDrawCreate(124.666694, 354.111175, "LD_SPAC:white");
	TextDrawLetterSize(TD_Hud[1], 0.000000, 0.000000);
	TextDrawTextSize(TD_Hud	[1], 70.000000, 11.000000);
	TextDrawAlignment(TD_Hud[1], 1);
	TextDrawColor(TD_Hud[1], 255);
	TextDrawSetShadow(TD_Hud[1], 0);
	TextDrawSetOutline(TD_Hud[1], 0);
	TextDrawBackgroundColor(TD_Hud[1], 255);
	TextDrawFont(TD_Hud[1], 4);
	TextDrawSetProportional(TD_Hud[1], 0);
	TextDrawSetShadow(TD_Hud[1], 0);

	TD_Hud[2] = TextDrawCreate(184.333297, 351.207611, "ld_beat:chit");
	TextDrawLetterSize(TD_Hud[2], 0.000000, 0.000000);
	TextDrawTextSize(TD_Hud[2], 19.000000, 17.000000);
	TextDrawAlignment(TD_Hud[2], 1);
	TextDrawColor(TD_Hud[2], 255);
	TextDrawSetShadow(TD_Hud[2], 0);
	TextDrawSetOutline(TD_Hud[2], 0);
	TextDrawBackgroundColor(TD_Hud[2], 255);
	TextDrawFont(TD_Hud[2], 4);
	TextDrawSetProportional(TD_Hud[2], 0);
	TextDrawSetShadow(TD_Hud[2], 0);

	TD_Hud[3] = TextDrawCreate(124.333358, 371.118804, "LD_SPAC:white");
	TextDrawLetterSize(TD_Hud[3], 0.000000, 0.000000);
	TextDrawTextSize(TD_Hud[3], 70.000000, 11.000000);
	TextDrawAlignment(TD_Hud[3], 1);
	TextDrawColor(TD_Hud[3], 255);
	TextDrawSetShadow(TD_Hud[3], 0);
	TextDrawSetOutline(TD_Hud[3], 0);
	TextDrawBackgroundColor(TD_Hud[3], 255);
	TextDrawFont(TD_Hud[3], 4);
	TextDrawSetProportional(TD_Hud[3], 0);
	TextDrawSetShadow(TD_Hud[3], 0);

	TD_Hud[4] = TextDrawCreate(115.666664, 368.215240, "ld_beat:chit");
	TextDrawLetterSize(TD_Hud[4], 0.000000, 0.000000);
	TextDrawTextSize(TD_Hud[4], 19.000000, 17.000000);
	TextDrawAlignment(TD_Hud[4], 1);
	TextDrawColor(TD_Hud[4], 255);
	TextDrawSetShadow(TD_Hud[4], 0);
	TextDrawSetOutline(TD_Hud[4], 0);
	TextDrawBackgroundColor(TD_Hud[4], 255);
	TextDrawFont(TD_Hud[4], 4);
	TextDrawSetProportional(TD_Hud[4], 0);
	TextDrawSetShadow(TD_Hud[4], 0);

	TD_Hud[5] = TextDrawCreate(119.333374, 351.207336, "LD_OTB2:Ric1");
	TextDrawLetterSize(TD_Hud[5], 0.000000, 0.000000);
	TextDrawTextSize(TD_Hud[5], 14.000000, 17.000000);
	TextDrawAlignment(TD_Hud[5], 1);
	TextDrawColor(TD_Hud[5], -1);
	TextDrawSetShadow(TD_Hud[5], 0);
	TextDrawSetOutline(TD_Hud[5], 0);
	TextDrawBackgroundColor(TD_Hud[5], 255);
	TextDrawFont(TD_Hud[5], 4);
	TextDrawSetProportional(TD_Hud[5], 0);
	TextDrawSetShadow(TD_Hud[5], 0);

	TD_Hud[6] = TextDrawCreate(184.333282, 368.215240, "ld_beat:chit");
	TextDrawLetterSize(TD_Hud[6], 0.000000, 0.000000);
	TextDrawTextSize(TD_Hud[6], 19.000000, 17.000000);
	TextDrawAlignment(TD_Hud[6], 1);
	TextDrawColor(TD_Hud[6], 255);
	TextDrawSetShadow(TD_Hud[6], 0);
	TextDrawSetOutline(TD_Hud[6], 0);
	TextDrawBackgroundColor(TD_Hud[6], 255);
	TextDrawFont(TD_Hud[6], 4);
	TextDrawSetProportional(TD_Hud[6], 0);
	TextDrawSetShadow(TD_Hud[6], 0);

	TD_Hud[7] = TextDrawCreate(124.666687, 388.541198, "LD_SPAC:white");
	TextDrawLetterSize(TD_Hud[7], 0.000000, 0.000000);
	TextDrawTextSize(TD_Hud[7], 70.000000, 11.000000);
	TextDrawAlignment(TD_Hud[7], 1);
	TextDrawColor(TD_Hud[7], 255);
	TextDrawSetShadow(TD_Hud[7], 0);
	TextDrawSetOutline(TD_Hud[7], 0);
	TextDrawBackgroundColor(TD_Hud[7], 255);
	TextDrawFont(TD_Hud[7], 4);
	TextDrawSetProportional(TD_Hud[7], 0);
	TextDrawSetShadow(TD_Hud[7], 0);

	TD_Hud[8] = TextDrawCreate(115.999938, 385.637481, "ld_beat:chit");
	TextDrawLetterSize(TD_Hud[8], 0.000000, 0.000000);
	TextDrawTextSize(TD_Hud[8], 19.000000, 17.000000);
	TextDrawAlignment(TD_Hud[8], 1);
	TextDrawColor(TD_Hud[8], 255);
	TextDrawSetShadow(TD_Hud[8], 0);
	TextDrawSetOutline(TD_Hud[8], 0);
	TextDrawBackgroundColor(TD_Hud[8], 255);
	TextDrawFont(TD_Hud[8], 4);
	TextDrawSetProportional(TD_Hud[8], 0);
	TextDrawSetShadow(TD_Hud[8], 0);

	TD_Hud[9] = TextDrawCreate(183.999877, 385.637481, "ld_beat:chit");
	TextDrawLetterSize(TD_Hud[9], 0.000000, 0.000000);
	TextDrawTextSize(TD_Hud[9], 19.000000, 17.000000);
	TextDrawAlignment(TD_Hud[9], 1);
	TextDrawColor(TD_Hud[9], 255);
	TextDrawSetShadow(TD_Hud[9], 0);
	TextDrawSetOutline(TD_Hud[9], 0);
	TextDrawBackgroundColor(TD_Hud[9], 255);
	TextDrawFont(TD_Hud[9], 4);
	TextDrawSetProportional(TD_Hud[9], 0);
	TextDrawSetShadow(TD_Hud[9], 0);

	TD_Hud[10] = TextDrawCreate(124.333351, 405.133972, "LD_SPAC:white");
	TextDrawLetterSize(TD_Hud[10], 0.000000, 0.000000);
	TextDrawTextSize(TD_Hud[10], 70.000000, 11.000000);
	TextDrawAlignment(TD_Hud[10], 1);
	TextDrawColor(TD_Hud[10], 255);
	TextDrawSetShadow(TD_Hud[10], 0);
	TextDrawSetOutline(TD_Hud[10], 0);
	TextDrawBackgroundColor(TD_Hud[10], 255);
	TextDrawFont(TD_Hud[10], 4);
	TextDrawSetProportional(TD_Hud[10], 0);
	TextDrawSetShadow(TD_Hud[10], 0);

	TD_Hud[11] = TextDrawCreate(115.999938, 402.230072, "ld_beat:chit");
	TextDrawLetterSize(TD_Hud[11], 0.000000, 0.000000);
	TextDrawTextSize(TD_Hud[11], 19.000000, 17.000000);
	TextDrawAlignment(TD_Hud[11], 1);
	TextDrawColor(TD_Hud[11], 255);
	TextDrawSetShadow(TD_Hud[11], 0);
	TextDrawSetOutline(TD_Hud[11], 0);
	TextDrawBackgroundColor(TD_Hud[11], 255);
	TextDrawFont(TD_Hud[11], 4);
	TextDrawSetProportional(TD_Hud[11], 0);
	TextDrawSetShadow(TD_Hud[11], 0);

	TD_Hud[12] = TextDrawCreate(183.666656, 402.230072, "ld_beat:chit");
	TextDrawLetterSize(TD_Hud[12], 0.000000, 0.000000);
	TextDrawTextSize(TD_Hud[12], 19.000000, 17.000000);
	TextDrawAlignment(TD_Hud[12], 1);
	TextDrawColor(TD_Hud[12], 255);
	TextDrawSetShadow(TD_Hud[12], 0);
	TextDrawSetOutline(TD_Hud[12], 0);
	TextDrawBackgroundColor(TD_Hud[12], 255);
	TextDrawFont(TD_Hud[12], 4);
	TextDrawSetProportional(TD_Hud[12], 0);
	TextDrawSetShadow(TD_Hud[12], 0);

	TD_Hud[13] = TextDrawCreate(119.333366, 371.118286, "hud:radar_gangG");
	TextDrawLetterSize(TD_Hud[13], 0.000000, 0.000000);
	TextDrawTextSize(TD_Hud[13], 12.000000, 11.000000);
	TextDrawAlignment(TD_Hud[13], 1);
	TextDrawColor(TD_Hud[13], -1);
	TextDrawSetShadow(TD_Hud[13], 0);
	TextDrawSetOutline(TD_Hud[13], 0);
	TextDrawBackgroundColor(TD_Hud[13], 255);
	TextDrawFont(TD_Hud[13], 4);
	TextDrawSetProportional(TD_Hud[13], 0);
	TextDrawSetShadow(TD_Hud[13], 0);

	TD_Hud[14] = TextDrawCreate(122.333358, 388.955261, "hud:radar_dateFood");
	TextDrawLetterSize(TD_Hud[14], 0.000000, 0.000000);
	TextDrawTextSize(TD_Hud[14], 9.000000, 10.000000);
	TextDrawAlignment(TD_Hud[14], 1);
	TextDrawColor(TD_Hud[14], -1);
	TextDrawSetShadow(TD_Hud[14], 0);
	TextDrawSetOutline(TD_Hud[14], 0);
	TextDrawBackgroundColor(TD_Hud[14], 255);
	TextDrawFont(TD_Hud[14], 4);
	TextDrawSetProportional(TD_Hud[14], 0);
	TextDrawSetShadow(TD_Hud[14], 0);

	TD_Hud[15] = TextDrawCreate(122.333343, 405.547851, "hud:radar_dateDrink");
	TextDrawLetterSize(TD_Hud[15], 0.000000, 0.000000);
	TextDrawTextSize(TD_Hud[15], 9.000000, 10.000000);
	TextDrawAlignment(TD_Hud[15], 1);
	TextDrawColor(TD_Hud[15], -1);
	TextDrawSetShadow(TD_Hud[15], 0);
	TextDrawSetOutline(TD_Hud[15], 0);
	TextDrawBackgroundColor(TD_Hud[15], 255);
	TextDrawFont(TD_Hud[15], 4);
	TextDrawSetProportional(TD_Hud[15], 0);
	TextDrawSetShadow(TD_Hud[15], 0);
	return 1;
}