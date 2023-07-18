#pragma disablerecursion
#define SERVER_GM_TEXT "GTA SAN MOBILE"

#define PP_SYNTAX_FOR_POOL
#define PP_SYNTAX_AWAIT

#define COLOR_ALICEBLUE 0xF0F8FFFF


#include <a_samp>
#include <a_mysql>	
#include <streamer>
#include <yom_buttons>		
#include <ZCMD>
#include <sscanf2>
#include <foreach>
#include <YSI\y_timers>
#include <YSI\y_utils>
#include <PawnPlus>
#include <td-actions>



#if defined SOCKET_ENABLED
#include <socket>
#endif

#include "./includes/defines.pwn"
#include "./includes/enums.pwn"
#include "./includes/variables.pwn"
#include "./includes/timers.pwn"
#include "./includes/functions.pwn"
#include "./includes/commands.pwn"
#include "./includes/mysql.pwn"
#include "./includes/OnPlayerLoad.pwn"
#include "./includes/callbacks.pwn"
#include "./includes/textdraws.pwn"
#include "./includes/streamer.pwn"
#include "./includes/OnDialogResponse.pwn"
#include "./includes/haican.pwn"
#include "./includes/rob.pwn"
#include "./includes/daumo.pwn"
#include "./includes/lumberjack1.pwn"
#include "./includes/raumuong.pwn"
#include "./includes/giaohang.pwn"
#include "./includes/textdraw.pwn"
#include "./includes/Speedo-PNSA.pwn"
#include "./includes/Phone.pwn"
#include "./includes/thuexe.pwn"
#include "./includes/giaodien.pwn"

#include "./includes/miner_liv.inc"
#include "./includes/electrician.inc"
#include "./includes/fireman.inc"
#include "./includes/fisherman.inc"
main() {}

public OnGameModeInit()
{
	print("Dang chuan bi tai gamemode, xin vui long cho doi...");
	g_mysql_Init();
	return 1;
}

public OnGameModeExit()
{
    g_mysql_Exit();
	return 1;
}
