/********************************************
 * OnPlayerDamage(Ex)! V3.0                 *
 * OnPlayerTakeDamage(playerid, issuerid, Float:HealthLost,Float:ArmourLost, weaponid);
 * OnPlayerGiveDamage(playerid, damagedid, Float:HealthLost,Float:ArmourLost, weaponid);
 * Credits: wups                                                        *
 ********************************************/
 
#include <a_samp>
 
static
        Float:Ex_PHealth[MAX_PLAYERS],
        Float:Ex_Armour[MAX_PLAYERS],
        bool:Ex_OPU;
       
public OnPlayerUpdate(playerid)
{
        GetPlayerHealth(playerid,Ex_PHealth[playerid]);
        GetPlayerArmour(playerid,Ex_Armour[playerid]);
        return (Ex_OPU)?CallLocalFunction("Ex_OnPlayerUpdate","i",playerid):1;
}
#if defined _ALS_OnPlayerUpdate
        #undef OnOnPlayerUpdate
#else
        #define _ALS_OnPlayerUpdate
#endif
#define OnPlayerUpdate Ex_OnPlayerUpdate
forward Ex_OnPlayerUpdate(playerid);
public OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid)
{
        new
                Float:Ex_HP,
                Float:Ex_AP,
                Float:Ret_HPLost,
                Float:Ret_APLost;
        GetPlayerHealth(playerid,Ex_HP);
        GetPlayerArmour(playerid,Ex_AP);
        if(Ex_AP != Ex_Armour[playerid]) Ret_APLost = (Ex_Armour[playerid]-Ex_AP);
        if(Ex_HP != Ex_PHealth[playerid]) Ret_HPLost = (Ex_PHealth[playerid]-Ex_HP);
        Ex_PHealth[playerid]=Ex_HP;
        Ex_Armour[playerid]=Ex_AP;
        return CallLocalFunction("Ex_OnPlayerTakeDamage","iiffi", playerid,issuerid,Ret_HPLost,Ret_APLost,weaponid);
}
#if defined _ALS_OnPlayerTakeDamage
        #undef OnPlayerTakeDamage
#else
        #define _ALS_OnPlayerTakeDamage
#endif
#define OnPlayerTakeDamage Ex_OnPlayerTakeDamage
forward Ex_OnPlayerTakeDamage(playerid, issuerid, Float:HealthLost,Float:ArmourLost, weaponid);
public OnPlayerGiveDamage(playerid, damagedid, Float:amount, weaponid)
{
        new
                Float:Ex_HP,
                Float:Ex_AP,
                Float:Ret_HPLost,
                Float:Ret_APLost;
    if(damagedid != INVALID_PLAYER_ID)
        {
                GetPlayerHealth(damagedid,Ex_HP);
                GetPlayerArmour(damagedid,Ex_AP);
                if(Ex_AP != Ex_Armour[damagedid]) Ret_APLost = (Ex_Armour[damagedid]-Ex_AP);
                if(Ex_HP != Ex_PHealth[damagedid]) Ret_HPLost = (Ex_PHealth[damagedid]-Ex_HP);
                Ex_PHealth[damagedid]=Ex_HP;
                Ex_Armour[damagedid]=Ex_AP;
        }
        return CallLocalFunction("Ex_OnPlayerGiveDamage","iiffi" ,playerid,damagedid,Ret_HPLost,Ret_APLost,weaponid);
 
}
#if defined _ALS_OnPlayerGiveDamage
        #undef OnPlayerGiveDamage
#else
        #define _ALS_OnPlayerGiveDamage
#endif
#define OnPlayerGiveDamage Ex_OnPlayerGiveDamage
forward Ex_OnPlayerGiveDamage(playerid, damagedid, Float:HealthLost,Float:ArmourLost, weaponid);
 
#if !defined FILTERSCRIPT
        // OnGameModeInit
        public OnGameModeInit()
        {
                Ex_OPU = (funcidx("Ex_OnPlayerUpdate") != -1);
                return (funcidx("Ex_OnGameModeInit") != -1)?CallLocalFunction("Ex_OnGameModeInit",""):1;
        }
        #if defined _ALS_OnGameModeInit
                #undef OnGameModeInit
        #else
                #define _ALS_OnGameModeInit
        #endif
        #define OnGameModeInit Ex_OnGameModeInit
#else
        // OnFilterScriptInit
        public OnFilterScriptInit()
        {
                Ex_OPU = (funcidx("Ex_OnPlayerUpdate") != -1);
                return (funcidx("Ex_OnFilterScriptInit") != -1)?CallLocalFunction("Ex_OnFilterScriptInit",""):1;
        }
        #if defined _ALS_OnFilterScriptInit
                #undef OnFilterScriptInit
        #else
                #define _ALS_OnFilterScriptInit
        #endif
        #define OnFilterScriptInit Ex_OnFilterScriptInit
        forward Ex_OnFilterScriptInit();
#endif