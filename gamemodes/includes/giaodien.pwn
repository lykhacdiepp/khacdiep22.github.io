// Logo by #Dylan<\>
#include <a_samp>
#include <YSI\y_hooks>


new Text:giaodien0;
new Text:giaodien1;
new Text:giaodien2;
new Text:giaodien3;
new Text:giaodien4;
new Text:giaodien5;


    hook OnPlayerConnect(playerid)  {
giaodien0 = TextDrawCreate(300.000000, 424.000000, "00:00");
TextDrawBackgroundColor(giaodien0, 255);
TextDrawFont(giaodien0, 3);
TextDrawLetterSize(giaodien0, 0.470000, 2.100000);
TextDrawColor(giaodien0, -16711681);
TextDrawSetOutline(giaodien0, 1);
TextDrawSetProportional(giaodien0, 1);
TextDrawSetSelectable(giaodien0, 0);

giaodien1 = TextDrawCreate(5.000000, 247.000000, "ID:");
TextDrawBackgroundColor(giaodien1, 255);
TextDrawFont(giaodien1, 2);
TextDrawLetterSize(giaodien1, 0.380000, 1.700000);
TextDrawColor(giaodien1, -1);
TextDrawSetOutline(giaodien1, 1);
TextDrawSetProportional(giaodien1, 1);
TextDrawUseBox(giaodien1, 1);
TextDrawBoxColor(giaodien1, -16711681);
TextDrawTextSize(giaodien1, 0.000000, 0.000000);
TextDrawSetSelectable(giaodien1, 0);

giaodien2 = TextDrawCreate(26.000000, 245.000000, "0");
TextDrawBackgroundColor(giaodien2, 255);
TextDrawFont(giaodien2, 2);
TextDrawLetterSize(giaodien2, 0.210000, 2.000000);
TextDrawColor(giaodien2, -1);
TextDrawSetOutline(giaodien2, 1);
TextDrawSetProportional(giaodien2, 1);
TextDrawSetSelectable(giaodien2, 0);

giaodien3 = TextDrawCreate(1.000000, 271.000000, "18.07.2023");
TextDrawBackgroundColor(giaodien3, 255);
TextDrawFont(giaodien3, 3);
TextDrawLetterSize(giaodien3, 0.400000, 1.400000);
TextDrawColor(giaodien3, 16711935);
TextDrawSetOutline(giaodien3, 1);
TextDrawSetProportional(giaodien3, 1);
TextDrawSetSelectable(giaodien3, 0);

giaodien4 = TextDrawCreate(481.000000, 7.000000, "VG MOBILE");
TextDrawBackgroundColor(giaodien4, 255);
TextDrawFont(giaodien4, 2);
TextDrawLetterSize(giaodien4, 0.310000, 1.200000);
TextDrawColor(giaodien4, -1);
TextDrawSetOutline(giaodien4, 0);
TextDrawSetProportional(giaodien4, 1);
TextDrawSetShadow(giaodien4, 0);
TextDrawUseBox(giaodien4, 1);
TextDrawBoxColor(giaodien4, -16711681);
TextDrawTextSize(giaodien4, 565.000000, 150.000000);
TextDrawSetSelectable(giaodien4, 0);

giaodien5 = TextDrawCreate(461.000000, 4.000000, "-");
TextDrawBackgroundColor(giaodien5, 255);
TextDrawFont(giaodien5, 3);
TextDrawLetterSize(giaodien5, 10.850004, 2.799993);
TextDrawColor(giaodien5, -65281);
TextDrawSetOutline(giaodien5, 0);
TextDrawSetProportional(giaodien5, 1);
TextDrawSetShadow(giaodien5, 0);
TextDrawSetSelectable(giaodien5, 0);
	return 1;
}

hook OnPlayerUpdate(playerid)   {
	return 1;
}

stock giaodienn(playerid) {
    TextDrawHideForPlayer(playerid, giaodien0);
	TextDrawHideForPlayer(playerid, giaodien1);
    TextDrawHideForPlayer(playerid, giaodien2);
	TextDrawHideForPlayer(playerid, giaodien3);
    TextDrawHideForPlayer(playerid, giaodien4);

    TextDrawShowForPlayer(playerid, Textdraw0);
    TextDrawShowForPlayer(playerid, Textdraw1);
    TextDrawShowForPlayer(playerid, Textdraw2);
    TextDrawShowForPlayer(playerid, Textdraw3);
    TextDrawShowForPlayer(playerid, Textdraw4);
    TextDrawShowForPlayer(playerid, Textdraw5);

	new string[128];
	format(string, sizeof string, "%d", playerid);
	TextDrawSetString(Textdraw3, string);
	format(string, sizeof string, "%d", PlayerInfo[playerid][pLevel]);
	TextDrawSetString(Textdraw5, string);

    new year, month, day;
	getdate(year, month, day);
	new days[1280];
	format(days, sizeof(days), "%d/%d/%d", day, month, year);
	TextDrawSetString(Textdraw1, days);
    return 1;
	
    return 1;
}

stock giaodien(playerid) {
    TextDrawShowForPlayer(playerid, giaodien0);
	TextDrawShowForPlayer(playerid, giaodien1);
    TextDrawShowForPlayer(playerid, giaodien2);
	TextDrawShowForPlayer(playerid, giaodien3);
    TextDrawShowForPlayer(playerid, giaodien4);
 //   TextDrawShowForPlayer(playerid, giaodien5);
    
    TextDrawHideForPlayer(playerid, Textdraw0);
    TextDrawHideForPlayer(playerid, Textdraw1);
    TextDrawHideForPlayer(playerid, Textdraw2);
    TextDrawHideForPlayer(playerid, Textdraw3);
    TextDrawHideForPlayer(playerid, Textdraw4);
    TextDrawHideForPlayer(playerid, Textdraw5);

    new year, month, day;
	getdate(year, month, day);
	new string[128];
	format(string, sizeof string, "%d", playerid);
	TextDrawSetString(giaodien2, string);
/*	format(string, sizeof string, "%d", PlayerInfo[playerid][pLevel]);
	TextDrawSetString(Textdraw5, string);*/


	new days[1280];
	format(days, sizeof(days), "%d.%d.%d", day, month, year);
	TextDrawSetString(giaodien3, days);
    return 1;
}
