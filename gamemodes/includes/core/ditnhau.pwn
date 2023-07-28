
/*Don't Remove Credits Please
Discord Link System By: MegaSardine

i Worked Hard For this to Fix The Errors
Steal = Community Ban
#Respect*/
--------------------------------------------------------------------------------


// Discord Enum
enum dcInfo
{
    dcName[DCC_USERNAME_SIZE],
    dcTag[DCC_ID_SIZE],
    dcId[20 + 1]
};
new DiscordInfo[dcInfo];
new VerifyCode[MAX_PLAYERS];


// Player Enum
enum pEnum
{
	pVerified,
	pCode,
	pDiscordName[32+1],
	pDiscordTag[20+1],
	pDiscordID[20+1],
}

#define THREAD_SELECT_CODE          58 // You Can Adjust This If You Wanted To

// Dialog Enum
enum
{
    DIALOG_VERIFICATION1,
    DIALOG_VERIFICATION,
}

// THREAD_PROCESS_LOGIN
PlayerInfo[extraid][pDiscordTag] = cache_get_field_content_int(0, "discordtag");
cache_get_field_content(0, "discordname", PlayerInfo[extraid][pDiscordName], connectionID, 16);
cache_get_field_content(0, "discordid", PlayerInfo[extraid][pDiscordID], connectionID, 21);

PlayerInfo[extraid][pVerified] = cache_get_field_content_int(0, "verify");

PlayerInfo[extraid][pCode] = cache_get_field_content_int(0, "code");
if(PlayerInfo[extraid][pVerified] == 1)
{
	PlayerInfo[extraid][pCode] = 0;
	mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET code = %i WHERE uid = %i", PlayerInfo[extraid][pCode], PlayerInfo[extraid][pID]);
	mysql_tquery(connectionID, queryBuffer);
}


// ONPLAYERCONNECT
    PlayerInfo[playerid][pCode] = 0;
    PlayerInfo[playerid][pVerified] = 0;
    strcpy(PlayerInfo[playerid][pDiscordName], "None", 128);
    PlayerInfo[playerid][pDiscordTag] = 0;
    PlayerInfo[playerid][pDiscordID] = 0;
    VerifyCode[playerid] = 0;
//


// OnDialogRespose
    if(dialogid == DIALOG_VERIFICATION)
    {
        new string[900];
        if(response)
        {
            switch(listitem)
            {
                case 0: return 1; // Name
                case 2:
                {
                    if(PlayerInfo[playerid][pVerified])
                    {
                        SetPVarInt(playerid, "Unverification", 1);
                        format(string, sizeof(string), "Welcome to "SERVER_NAME" %s,\nDo you want to be unverified?\nYou will not be able to view some channels such as:\n> Global Chatroom\n> Report System\n> Newbie Chatroom\n.", GetRPName(playerid), PlayerInfo[playerid][pCode]);
                        return ShowPlayerDialog(playerid, DIALOG_VERIFICATION1, DIALOG_STYLE_MSGBOX, "Account Verification", string, "Okay", "");
                    }
                    else
                    {
                        //SetTimerEx("Expiration", 300000, true, "i", playerid);
                        SetPVarInt(playerid, "Verification", 1);
                        SendClientMessage(playerid, COLOR_SYNTAX, "If your code is ''0', please use /getnewcode to have another code.");
                        format(string, sizeof(string), "Welcome to "SERVER_NAME" %s,\nYou can verify your account using this code %i.", GetRPName(playerid), PlayerInfo[playerid][pCode]);
                        return ShowPlayerDialog(playerid, DIALOG_VERIFICATION1, DIALOG_STYLE_MSGBOX, "Account Verification", string, "Okay", "");
                }
            }
        }
    }
	if(dialogid == DIALOG_VERIFICATION1)
    {
        if(response)
        {
            if(GetPVarInt(playerid, "Verification") == 1)
            {
                DeletePVar(playerid, "Verification");
                new string[900];
                format(string, sizeof(string), "Name:\t%s\n\
                Discord: %s#%s\n\
                Verification:\t %s", GetRPName(playerid), PlayerInfo[playerid][pDiscordName], PlayerInfo[playerid][pDiscordTag], (PlayerInfo[playerid][pVerified]?(""GREEN"Verified"WHITE""):(""RED"Not Verified")));
                ShowPlayerDialog(playerid, DIALOG_VERIFICATION, DIALOG_STYLE_LIST, "Account Verification", string, "Select", "Cancel");
            }
            else if(GetPVarInt(playerid, "Unverification") == 1)
            {
                new string[64];

                // Unlinking Discord Account
                new DCC_Guild:guild = DCC_FindGuildById("CHANGE THIS"); // Now to get the guild ID/Server ID //
                new DCC_Role:role = DCC_FindRoleById("CHANGE THIS"); // Verified Role
                new DCC_Role:role1 = DCC_FindRoleById("CHANGE THIS"); // Unverified Role
                new DCC_User:user = DCC_FindUserByName(PlayerInfo[playerid][pDiscordName], PlayerInfo[playerid][pDiscordTag]);
                DCC_RemoveGuildMemberRole(guild, user, role);
                DCC_AddGuildMemberRole(guild, user, role1);
                string = "";
                DCC_SetGuildMemberNickname(guild, user, string);
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET discordname = 'None', discordtag = '0000', discordid = '0' WHERE uid = %i", PlayerInfo[playerid][pID]);
                mysql_tquery(connectionID, queryBuffer);

                // In-Game Unverification
                DeletePVar(playerid, "Unverification");
                PlayerInfo[playerid][pVerified] = 0;
                return SCM(playerid, COLOR_YELLOW, "You are not Un-Verified. You can verify Yourself again using '/settings'");
            }
        }
    }
//

// IN-GAME COMMANDS
CMD:getnewcode(playerid, params[])
{
    if(PlayerInfo[playerid][pVerified] == 1)
    {
        return SendClientMessage(playerid, COLOR_SYNTAX, "You are currently verified.");
    }
    new code = Random(100000, 999999);
    PlayerInfo[playerid][pCode] = code;
    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET code = %i WHERE uid = %i", code, PlayerInfo[playerid][pID]);
    mysql_tquery(connectionID, queryBuffer);
    SendClientMessage(playerid, COLOR_GREEN, "Code has been re-established. You may see it at '/settings'!!!");
    return 1;
}
CMD:settings(playerid, params[])
{
	new string[248];
	format(string, sizeof(string), "Name:\t%s\n\
	Discord: %s#%i \n\
	Verification:\t%s", GetRPName(playerid), PlayerInfo[playerid][pDiscordName], PlayerInfo[playerid][pDiscordTag], (PlayerInfo[playerid][pVerified] ? (""GREEN"Verified"WHITE"") : (""RED"Not Verified")));
	ShowPlayerDialog(playerid, DIALOG_VERIFICATION, DIALOG_STYLE_LIST, "Account Verification", string, "Select", "Cancel");
	return 1;
}

// Discord Command //

DCMD:link(user, channel, params[])
{
    // VARIABLES //
    new DCC_Guild:guild = DCC_FindGuildById("SERRVER ID");//server id
    new DCC_Role:role = DCC_FindRoleById("VERIFIED ROLE ID");// Verified Role
    new DCC_Role:role1 = DCC_FindRoleById("UNVERIFIED ROLE ID");// Unverified Role
    new DCC_Channel:channell = DCC_FindChannelById("VERIFICATION CHANNEL ID");
    new chan[500];
    DCC_GetChannelName(channell, chan, sizeof(chan));
    new bool:hasRole;
    new name[32+1], id[20+1], user_id[20+1];
    new code;

    // Checking if the user has the Verified role. if is, we will not allow the user to verify again.
    DCC_HasGuildMemberRole(guild, user, role, hasRole);


    // CODE //
    if(channel != DCC_FindChannelById("VERIFICATION CHANNEL ID"))
    {
        new str[1500];
        format(str, sizeof(str), "Wrong Channel\nYou can use this command at <#VERIFICATION CHANNEL ID>.", chan);
    }
    if(!IsNumeric(params))
    {
        new str[500], footer[500];
        format(str, sizeof(str), "Invalid Verification Token.");
        new DCC_Embed:embed = DCC_CreateEmbed("**Error: Invalid Token.**", str);
        DCC_SetEmbedColor(embed, 0xFF0000);
        format(footer, sizeof(footer), "WARNING: Attempting to link an account that is not yours can get you in trouble.");
        DCC_SetEmbedFooter(embed, footer);
        return DCC_SendChannelEmbedMessage(channel, embed);
    }

    if(sscanf(params, "i", code))
        return DCC_SendChannelMessage(channel, "***Discord: !link [code]***");

    if(hasRole)
    {
        new str[500], footer[500];
        format(str, sizeof(str), "Your discord account has been link to another account!.");
        new DCC_Embed:embed = DCC_CreateEmbed("**Error: Discord Account is already link to another account.**", str);
        DCC_SetEmbedColor(embed, 0xFF0000);
        format(footer, sizeof(footer), "Your Server Name\nYou can only link 1 Discord account to SAMP 1 Account at a time.");
        DCC_SetEmbedFooter(embed, footer);
        return DCC_SendChannelEmbedMessage(channel, embed);
    }

    if(code == 0)
    {
        return DCC_SendChannelMessage(channel, "> ***Please enter valid code.***");
    }
    for(new i = 0 ; i < MAX_PLAYERS; i ++)
    {

        if(PlayerInfo[i][pCode] == code)
        {
            new str[9999], footer[500];

            DCC_AddGuildMemberRole(guild, user, role);
            DCC_RemoveGuildMemberRole(guild, user, role1);
            DCC_SetGuildMemberNickname(guild, user, PlayerInfo[i][pUsername]);
            PlayerInfo[i][pVerified] = 1;
            PlayerInfo[i][pCode] = 0;
            mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET verify = 1 WHERE username = '%e'", PlayerInfo[i][pUsername]);
            mysql_tquery(connectionID, queryBuffer);
            // Storing their Discord user Name, and Discord User Tag //
            DCC_GetUserId(user, user_id, sizeof(user_id));
            DCC_GetUserName(user, name, sizeof(name));
            DCC_GetUserDiscriminator(user, id, sizeof(id));
            PlayerInfo[i][pDiscordName] = name;
            PlayerInfo[i][pDiscordTag] = id;
            //PlayerInfo[i][pDiscordID] = user_id;
            mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET discordid = '%s', discordname = '%s', discordtag = '%s' WHERE username = '%e'", user_id, name, id, PlayerInfo[i][pUsername]);
            mysql_tquery(connectionID, queryBuffer);
            format(str, sizeof(str), "Your account is **%s** has been successfully linked to your discord account.\nYou Can Now Access Commands And Others Ingame.", PlayerInfo[i][pUsername]);
            new DCC_Embed:embed = DCC_CreateEmbed();
            DCC_SetEmbedTitle(embed, "Succesfully verified!");
            DCC_SetEmbedDescription(embed, str);
            DCC_SetEmbedColor(embed, 0x0099FF33);
            format(footer, sizeof(footer), "Your Server Name");
            DCC_SetEmbedFooter(embed, footer);
            DCC_SendChannelEmbedMessage(channell, embed);
            return 1;
        }
        else
        {
            new str[9999], footer[500];
            format(str, sizeof(str), "Invalid Verification Token.");
            new DCC_Embed:embed = DCC_CreateEmbed("**Error: Invalid Token.**", str);
            DCC_SetEmbedColor(embed, 0xFF0000);
            format(footer, sizeof(footer), "WARNING: Attempting to link an account that is not yours can get you in trouble.");
            DCC_SetEmbedFooter(embed, footer);
            DCC_SendChannelEmbedMessage(channel, embed);
            return 1;
        }
    }
    return 1;
}
forward OnQueryFinish(threadid, playerid);
public OnQueryFinish(threadid, playerid)
{
    new rows = cache_get_row_count(connectionID);
    switch(threadid)
    {
        case THREAD_SELECT_CODE:
        {
            if(!rows)
            {
                new DCC_Channel:channell = DCC_FindChannelById("");
                new str[500];

                format(str, sizeof(str), "The code you've been submitting is either invalid or used to an account that is now verified.");
                new DCC_Embed:embed = DCC_CreateEmbed("Invalid Code!", str);
                DCC_SetEmbedColor(embed, 0xFF0000);
                DCC_SendChannelEmbedMessage(channell, embed);
            }
            else
            {
                new DCC_User:user = DCC_FindUserByName(DiscordInfo[dcName], DiscordInfo[dcTag]);//DCC_FindUserById(DiscordInfo[dcId]);
                new DCC_Guild:guild = DCC_FindGuildById(""); // Now to get the guild ID //
                new DCC_Role:role = DCC_FindRoleById(""); // Verified Role
                new DCC_Role:role1 = DCC_FindRoleById(""); // Unverified Role
                new string[128];
                new username[MAX_PLAYER_NAME];
                new code[16];

                cache_get_field_content(0, "username", username);
                cache_get_field_content(0, "code", code);
                cache_get_field_content(0, "uid", PlayerInfo[MAX_PLAYERS][pID]);
                cache_get_field_content(0, "verify", PlayerInfo[MAX_PLAYERS][pVerified]);

                if(IsPlayerOnline(username))
                {
                    SendClientMessage(PlayerInfo[MAX_PLAYERS][pID], COLOR_GREEN, "You are now verified.");
                    PlayerInfo[MAX_PLAYERS][pVerified] = 1;
                }
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET verify = 1 WHERE username = '%e'", username);
                mysql_tquery(connectionID, queryBuffer);
                mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET discordname = '%s', discordtag = '%s' WHERE username = '%e'", DiscordInfo[dcName], DiscordInfo[dcTag], username);
                mysql_tquery(connectionID, queryBuffer);
                DCC_AddGuildMemberRole(guild, user, role);
                DCC_RemoveGuildMemberRole(guild, user, role1);

                DiscordInfo[dcId] = 0;
                DiscordInfo[dcName] = 0;
                DiscordInfo[dcTag] = 0;
                format(string, sizeof(string), "%s", PlayerInfo[playerid][pUsername]);
                DCC_SetGuildMemberNickname(guild, user, string);
            }
        }
    }
    return 1;
}

//---------------------------------------------------------[MYSQL SETUP]---------------------------------------------------------//


// Users > Structure > Create Table

// pCode:
name:code
type:int(11)
colation:
attributes:
null:Yes
default:As Defined - 0
comments:
extra:

// pVerified:
name:verify
type:int(11)
colation:
attributes:
null:Yes
default:As Defined - 0
comments:
extra:

// pDiscordTag:
name:discordtag
type:int(10)
colation:
attributes:
null:Yes
default:As Defined - 0
comments:
extra:

// pDiscordName:
name:discordname
type:varchar(128)
colation:latin1_swedish_ci
attributes:
null:Yes
default:As Defined - None
comments:
extra:

// pDiscordID:
name:discordid
type:varchar(25)
colation:latin1_swedish_ci
attributes:
null:Yes
default:As Defined - None
comments:
extra:
