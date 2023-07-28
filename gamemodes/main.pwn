
#define SERVER_GM_TEXT "Gta San Online Viet Nam"

#pragma disablerecursion
#pragma warning disable 208
#pragma warning disable 202
#pragma warning disable 219
#pragma warning disable 225

#include <a_samp>
#include <sampvoice>
#include <a_actor>
#include <s_actor>
#include <a_mysql>	
#include <streamer>
#include <yom_buttons>
#include <ZCMD>
#include <sscanf2>
#include <foreach>
#include <YSI\y_timers>
#include <YSI\y_utils>
#include <crashdetect>
#include <dininew>
//#include <3dspeed>
//#include <GPS>

#if defined SOCKET_ENABLED
#include <socket>
#endif
#include "./includes/core/defines.pwn"
//#include "./includes/core/logo.pwn"
//#include "./includes/core/cuopcuahang.pwn"
#include "./includes/core/loading.pwn"
#include "./includes/core/enums.pwn"
#include "./includes/core/variables.pwn"
#include "./includes/core/timers.pwn"
#include "./includes/core/functions.pwn"
#include "./includes/core/command.pwn"
#include "./includes/core/mysql.pwn"
#include "./includes/core/OnPlayerLoad.pwn"
#include "./includes/core/callbacks.pwn"
#include "./includes/core/textdraws.pwn"
#include "./includes/core/xoso.pwn"
#include "./includes/core/streamer.pwn"
#include "./includes/core/OnDialogResponse.pwn"


//#include "./includes/core/moctui.pwn"
#include "./includes/core/textdraw.pwn"


#include "./includes/faction/vehicles.pwn"

#pragma disablerecursion
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
