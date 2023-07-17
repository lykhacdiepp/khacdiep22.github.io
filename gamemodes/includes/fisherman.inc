#include <YSI\y_hooks>

native GameTextStr(playerid, AmxString:string, time, style) = GameTextForPlayer;

new const Float:fish_zone_arr[][] = {
	{-592.6427917480469, 1353.7856140136719, -496.6427917480469, 1436.7856140136719},
	{-528.642822265625, 1091.0713500976562, -428.642822265625, 1191.0713500976562},
	{-544.6427917480469, 1176.785629272461, -471.6427917480469, 1262.785629272461},
	{-581.6427917480469, 1215.78564453125, -504.6427917480469, 1286.78564453125},
	{-528.642822265625, 1015.0713272094727, -439.642822265625, 1091.0713272094727},
	{-552.642822265625, 933.0712890625, -463.642822265625, 1015.0712890625},
	{-584.6427917480469, 833.0713653564453, -484.6427917480469, 933.0713653564453},
	{-652.642822265625, 723.0713882446289, -538.642822265625, 833.0713882446289},
	{-693.642822265625, 327.07129096984863, -540.642822265625, 723.0712909698486},
	{-787.9284362792969, 1669.214225769043, -639.9284362792969, 1979.214225769043}
};

new fishZone[10];

hook OnGameModeInit() {
	for(new i = 0; i < 10; i ++) {
		fishZone[i] = CreateDynamicRectangle
		(
			fish_zone_arr[i][0],
			fish_zone_arr[i][1],
			fish_zone_arr[i][2],
			fish_zone_arr[i][3]
		);
	}
}

hook OnPlayerConnect(playerid) {
	PlayerInfo[playerid][static_working] = 0;
}

in_fisherman_area(const playerid) {
	new 
		Float:X, Float:Y, Float:Z;
	
	GetPlayerPos(playerid, X, Y, Z);
	#pragma unused X, Y

	for(new i = 0; i < 10; i ++) {
		if(IsPlayerInDynamicArea(playerid, fishZone[i]) && Z < 20.000) {
			return 1;
		}
	}	
	return 0;
}

CMD:thaluoi(playerid) {
	if(in_fisherman_area(playerid)) {
		if(!PlayerInfo[playerid][static_working]) {
			if(GetVehicleModel(GetPlayerVehicleID(playerid)) != 453) return SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "[FISHERMAN]: Ban can o tren thuyen danh ca");
			
			new 
				rand;
		
			PlayerInfo[playerid][static_working] = 1;
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "[FISHERMAN]: Dang tha luoi...");
			while(PlayerInfo[playerid][static_working]) {
				task_yield(1);
				if(!IsPlayerConnected(playerid) || !in_fisherman_area(playerid) || GetVehicleModel(GetPlayerVehicleID(playerid)) != 453) 
					break;

				if(random(5) + PlayerInfo[playerid][pKGFish] >= 100) {
					PlayerInfo[playerid][pKGFish] = 100;
					break;
				}
				if(random(3) != 0) {
					MessageStr(playerid, COLOR_LIGHTBLUE, str_format("Ban nhan duoc them %dkg | KG: %d", (rand = random(5)), PlayerInfo[playerid][pKGFish] + rand));
					PlayerInfo[playerid][pKGFish] += rand;
				}
				printf("%d", PlayerInfo[playerid][pKGFish]);
				await task_ms(3000);
			}
			PlayerInfo[playerid][static_working] = 0;
		}
	}
	else SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "[FISHERMAN]: Khong the tha luoi o day.");
	return 1;
}

