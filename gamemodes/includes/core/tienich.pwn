#include <a_samp>
#include <YSI\y_hooks>

#define         HOUSES_INT                  (5200)

CMD:houseint(playerid, params[])
{
    if (PlayerInfo[playerid][pAdmin] >= 1337)
        {
    ShowPlayerDialog(playerid, HOUSES_INT, DIALOG_STYLE_LIST, "Noi That Houses","House 1\n House 2\n House 3\n House 4\n House 5\n House 6\n House 7\n House 8\n House 9\n House 10\n House 11\n House 12\n House 13\n House 14\n House 15\n House 16", "Select", "Cancel");
  }
    else {
        SendClientMessageEx(playerid, COLOR_GREY, "Ban khong duoc phep su dung lenh nay.");
    }
    return 1;
} 

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
if(dialogid == HOUSES_INT)
 {
  if(response)
  {
   if(listitem == 0) // Burglary House #1
   {
      SetPlayerPos(playerid,234.6087, 1187.8195, 1080.2578);
      SetPlayerInterior(playerid,3);
   }
   if(listitem == 1) // Burglary House #2
   {
      SetPlayerPos(playerid,225.5707, 1240.0643, 1082.1406);
      SetPlayerInterior(playerid,2);
   }
   if(listitem == 2) // Burglary House #3
   {
      SetPlayerPos(playerid,224.288, 1289.1907, 1082.1406);
      SetPlayerInterior(playerid,1);
   }
   if(listitem == 3) // Burglary House #4
   {
      SetPlayerPos(playerid,239.2819, 1114.1991, 1080.9922);
      SetPlayerInterior(playerid,5);
   }
   if(listitem == 4) // Burglary House #5
   {
      SetPlayerPos(playerid,295.1391, 1473.3719, 1080.2578);
      SetPlayerInterior(playerid,15);
   }
   if(listitem == 5) // Burglary House #6
   {
      SetPlayerPos(playerid,261.1165, 1287.2197, 1080.2578);
      SetPlayerInterior(playerid,4);
   }
   if(listitem == 6) // Burglary House #7
   {
   SetPlayerPos(playerid,24.3769, 1341.1829, 1084.375);
      SetPlayerInterior(playerid,10);
   }
   if(listitem == 7) // Burglary House #8
   {
      SetPlayerPos(playerid,-262.1759, 1456.6158, 1084.3672);
      SetPlayerInterior(playerid,4);
   }
   if(listitem == 8) // Burglary House #9
   {
      SetPlayerPos(playerid,22.861, 1404.9165, 1084.4297);
      SetPlayerInterior(playerid,5);
   }
   if(listitem == 9) // Burglary House #10
   {
      SetPlayerPos(playerid,140.3679, 1367.8837, 1083.8621);
      SetPlayerInterior(playerid,5);
   }
      if(listitem == 10) // Burglary House #11
   {
      SetPlayerPos(playerid,234.2826, 1065.229, 1084.2101);
      SetPlayerInterior(playerid,6);
   }
   if(listitem == 11) // Burglary House #12
   {
      SetPlayerPos(playerid,-68.5145, 1353.8485, 1080.2109);
      SetPlayerInterior(playerid,6);
   }
   if(listitem == 12) // Burglary House #13
   {
      SetPlayerPos(playerid,-285.2511, 1471.197, 1084.375);
      SetPlayerInterior(playerid,15);
   }
   if(listitem == 13) // Burglary House #14
   {
      SetPlayerPos(playerid,-42.5267, 1408.23, 1084.4297);
      SetPlayerInterior(playerid,8);
   }
   if(listitem == 14) // Burglary House #15
   {
      SetPlayerPos(playerid,84.9244, 1324.2983, 1083.8594);
      SetPlayerInterior(playerid,9);
   }
   if(listitem == 15) // Burglary House #16
   {
      SetPlayerPos(playerid,260.7421, 1238.2261, 1084.2578);
      SetPlayerInterior(playerid,9);
   }
  }
  return 1;
 } 
 