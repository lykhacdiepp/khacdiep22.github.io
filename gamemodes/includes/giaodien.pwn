// Logo by #Dylan<\>
#include <a_samp>
#include <YSI\y_hooks>

//2
new Text:giaodien0;
new Text:giaodien1;
new Text:giaodien2;
new Text:giaodien3;
new Text:giaodien4;
new Text:giaodien5;
//3
new Text:giaodienn0;
new Text:giaodienn1;
new Text:giaodienn2;
new Text:giaodienn3;
new Text:giaodienn4;


    hook OnPlayerConnect(playerid)  {
    //3
giaodienn0 = TextDrawCreate(300.000000, 424.000000, "viet-game");
TextDrawBackgroundColor(giaodienn0, 255);
TextDrawFont(giaodienn0, 3);
TextDrawLetterSize(giaodienn0, 0.350000, 1.700000);
TextDrawColor(giaodienn0, -16776961);
TextDrawSetOutline(giaodienn0, 1);
TextDrawSetProportional(giaodienn0, 1);
TextDrawSetSelectable(giaodienn0, 0);

giaodienn1 = TextDrawCreate(16.000000, 431.000000, "id:");
TextDrawBackgroundColor(giaodienn1, -65281);
TextDrawFont(giaodienn1, 3);
TextDrawLetterSize(giaodienn1, 0.300000, 1.400000);
TextDrawColor(giaodienn1, 255);
TextDrawSetOutline(giaodienn1, 1);
TextDrawSetProportional(giaodienn1, 1);
TextDrawSetSelectable(giaodienn1, 0);

giaodienn2 = TextDrawCreate(31.000000, 433.000000, "0");
TextDrawBackgroundColor(giaodienn2, -65281);
TextDrawFont(giaodienn2, 3);
TextDrawLetterSize(giaodienn2, 0.500000, 1.000000);
TextDrawColor(giaodienn2, 255);
TextDrawSetOutline(giaodienn2, 1);
TextDrawSetProportional(giaodienn2, 1);
TextDrawSetSelectable(giaodienn2, 0);

giaodienn3 = TextDrawCreate(472.000000, 5.000000, "00:00");
TextDrawBackgroundColor(giaodienn3, 255);
TextDrawFont(giaodienn3, 3);
TextDrawLetterSize(giaodienn3, 0.490000, 1.300000);
TextDrawColor(giaodienn3, 16711935);
TextDrawSetOutline(giaodienn3, 0);
TextDrawSetProportional(giaodienn3, 1);
TextDrawSetShadow(giaodienn3, 1);
TextDrawSetSelectable(giaodienn3, 0);

giaodienn4 = TextDrawCreate(472.000000, 19.000000, "00/00/0000");
TextDrawBackgroundColor(giaodienn4, -16711681);
TextDrawFont(giaodienn4, 3);
TextDrawLetterSize(giaodienn4, 0.440000, 1.300000);
TextDrawColor(giaodienn4, -1);
TextDrawSetOutline(giaodienn4, 1);
TextDrawSetProportional(giaodienn4, 1);
TextDrawSetSelectable(giaodienn4, 0);
    
    //2
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

giaodien3 = TextDrawCreate(1.000000, 271.000000, "00/00/00");
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

    Textdraw0 = TextDrawCreate(276.000000, 5.000000, "vg:rp mobile");
    TextDrawBackgroundColor(Textdraw0, -16711681);
    TextDrawFont(Textdraw0, 3);
    TextDrawLetterSize(Textdraw0, 0.500000, 2.700001);
    TextDrawColor(Textdraw0, 16777215);
    TextDrawSetOutline(Textdraw0, 1);
    TextDrawSetProportional(Textdraw0, 1);
    TextDrawSetSelectable(Textdraw0, 0);

    Textdraw1 = TextDrawCreate(276.000000, 427.000000, "00/00/0000");
    TextDrawBackgroundColor(Textdraw1, 255);
    TextDrawFont(Textdraw1, 2);
    TextDrawLetterSize(Textdraw1, 0.310000, 1.600000);
    TextDrawColor(Textdraw1, 16777215);
    TextDrawSetOutline(Textdraw1, 0);
    TextDrawSetProportional(Textdraw1, 1);
    TextDrawSetShadow(Textdraw1, 1);
    TextDrawSetSelectable(Textdraw1, 0);

    Textdraw2 = TextDrawCreate(50.000000, 432.000000, "ID:");
    TextDrawBackgroundColor(Textdraw2, 255);
    TextDrawFont(Textdraw2, 1);
    TextDrawLetterSize(Textdraw2, 0.250000, 1.399999);
    TextDrawColor(Textdraw2, 16777215);
    TextDrawSetOutline(Textdraw2, 1);
    TextDrawSetProportional(Textdraw2, 1);
    TextDrawUseBox(Textdraw2, 1);
    TextDrawBoxColor(Textdraw2, 255);
    TextDrawTextSize(Textdraw2, 73.000000, -115.000000);
    TextDrawSetSelectable(Textdraw2, 0);

    Textdraw3 = TextDrawCreate(63.000000, 434.000000, "0");
    TextDrawBackgroundColor(Textdraw3, 255);
    TextDrawFont(Textdraw3, 1);
    TextDrawLetterSize(Textdraw3, 0.500000, 1.000000);
    TextDrawColor(Textdraw3, -65281);
    TextDrawSetOutline(Textdraw3, 1);
    TextDrawSetProportional(Textdraw3, 1);
    TextDrawSetSelectable(Textdraw3, 0);

    Textdraw4 = TextDrawCreate(527.000000, 430.000000, "LEVEL:");
    TextDrawBackgroundColor(Textdraw4, 255);
    TextDrawFont(Textdraw4, 1);
    TextDrawLetterSize(Textdraw4, 0.319999, 1.399999);
    TextDrawColor(Textdraw4, 16777215);
    TextDrawSetOutline(Textdraw4, 1);
    TextDrawSetProportional(Textdraw4, 1);
    TextDrawUseBox(Textdraw4, 1);
    TextDrawBoxColor(Textdraw4, 255);
    TextDrawTextSize(Textdraw4, 571.000000, 397.000000);
    TextDrawSetSelectable(Textdraw4, 0);

    Textdraw5 = TextDrawCreate(561.000000, 430.000000, "1");
    TextDrawBackgroundColor(Textdraw5, 255);
    TextDrawFont(Textdraw5, 1);
    TextDrawLetterSize(Textdraw5, 0.509999, 1.400000);
    TextDrawColor(Textdraw5, -65281);
    TextDrawSetOutline(Textdraw5, 1);
    TextDrawSetProportional(Textdraw5, 1);
    TextDrawSetSelectable(Textdraw5, 0);
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
    
    TextDrawHideForPlayer(playerid, giaodienn0);
	TextDrawHideForPlayer(playerid, giaodienn1);
    TextDrawHideForPlayer(playerid, giaodienn2);
//	TextDrawHideForPlayer(playerid, giaodienn3);
    TextDrawHideForPlayer(playerid, giaodienn4);
    

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
  //  TextDrawShowForPlayer(playerid, giaodien5);
    
    TextDrawHideForPlayer(playerid, Textdraw0);
    TextDrawHideForPlayer(playerid, Textdraw1);
    TextDrawHideForPlayer(playerid, Textdraw2);
    TextDrawHideForPlayer(playerid, Textdraw3);
    TextDrawHideForPlayer(playerid, Textdraw4);
    TextDrawHideForPlayer(playerid, Textdraw5);
    
    TextDrawHideForPlayer(playerid, giaodienn0);
	TextDrawHideForPlayer(playerid, giaodienn1);
    TextDrawHideForPlayer(playerid, giaodienn2);
//	TextDrawHideForPlayer(playerid, giaodienn3);
    TextDrawHideForPlayer(playerid, giaodienn4);

    new year, month, day;
	getdate(year, month, day);
	new string[128];
	format(string, sizeof string, "%d", playerid);
	TextDrawSetString(giaodien2, string);
/*	format(string, sizeof string, "%d", PlayerInfo[playerid][pLevel]);
	TextDrawSetString(Textdraw5, string);*/


	new days[1280];
	format(days, sizeof(days), "%d/%d/%d", day, month, year);
	TextDrawSetString(giaodien3, days);
    return 1;
}
stock giaodiennn(playerid) {

    TextDrawShowForPlayer(playerid, giaodienn0);
	TextDrawShowForPlayer(playerid, giaodienn1);
    TextDrawShowForPlayer(playerid, giaodienn2);
//	TextDrawShowForPlayer(playerid, giaodienn3);
    TextDrawShowForPlayer(playerid, giaodienn4);

    TextDrawHideForPlayer(playerid, giaodien0);
	TextDrawHideForPlayer(playerid, giaodien1);
    TextDrawHideForPlayer(playerid, giaodien2);
	TextDrawHideForPlayer(playerid, giaodien3);
    TextDrawHideForPlayer(playerid, giaodien4);
 //   TextDrawShowForPlayer(playerid, giaodien5);

    TextDrawHideForPlayer(playerid, Textdraw0);
    TextDrawHideForPlayer(playerid, Textdraw1);
    TextDrawHideForPlayer(playerid, Textdraw2);
    TextDrawHideForPlayer(playerid, Textdraw3);
    TextDrawHideForPlayer(playerid, Textdraw4);
    TextDrawHideForPlayer(playerid, Textdraw5);
    

    new year, month, day;
	getdate(year, month, day);
	new days[1280];
	format(days, sizeof(days), "%d/%d/%d", day, month, year);
	TextDrawSetString(giaodienn4, days);

	new string[128];
	format(string, sizeof string, "%d", playerid);
	TextDrawSetString(giaodienn2, string);
/*	format(string, sizeof string, "%d", PlayerInfo[playerid][pLevel]);
	TextDrawSetString(Textdraw5, string);*/

    return 1;
}
stock tathud(playerid) {


    TextDrawHideForPlayer(playerid, giaodienn0);
	TextDrawHideForPlayer(playerid, giaodienn1);
    TextDrawHideForPlayer(playerid, giaodienn2);
//	TextDrawHideForPlayer(playerid, giaodienn3);
    TextDrawHideForPlayer(playerid, giaodienn4);

    TextDrawHideForPlayer(playerid, giaodien0);
	TextDrawHideForPlayer(playerid, giaodien1);
    TextDrawHideForPlayer(playerid, giaodien2);
	TextDrawHideForPlayer(playerid, giaodien3);
    TextDrawHideForPlayer(playerid, giaodien4);
 //   TextDrawShowForPlayer(playerid, giaodien5);

    TextDrawHideForPlayer(playerid, Textdraw0);
    TextDrawHideForPlayer(playerid, Textdraw1);
    TextDrawHideForPlayer(playerid, Textdraw2);
    TextDrawHideForPlayer(playerid, Textdraw3);
    TextDrawHideForPlayer(playerid, Textdraw4);
    TextDrawHideForPlayer(playerid, Textdraw5);
    return 1;
}

CMD:giaodien(playerid, params[]) {
    return ShowPlayerDialog(playerid, GIAODIEN, DIALOG_STYLE_LIST, "GIAO DIEN","Giao Dien 1\nGiao Dien 2\nGiao Dien 3\nTat Giao Dien", "Chon", "Thoat");
}
CMD:giaodien2(playerid, params[])	{
	giaodien(playerid);
	return 1;
}
CMD:giaodien1(playerid, params[])	{
	giaodienn(playerid);
	return 1;
}
CMD:giaodien3(playerid, params[])	{
	giaodiennn(playerid);
	return 1;
}
CMD:tathud(playerid, params[])	{
	tathud(playerid);
	return 1;
}
