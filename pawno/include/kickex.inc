/* KickEx Function
 *
 * (c) Copyright 2009-2010, TheHoodRat SA:MP
 * This file is provided as is (no warranties).
 */

#include <a_samp>
#include <file>

#if defined _KickEx_included
#endinput
#endif
#define _KickEx_included

forward NewLine();

stock KickEx(playerid, reason[]) // KickEx is our handy function.
{//Let's see the code then!
   #pragma tabsize 0
    new PlayerName[24]; // Define the player's name.
    GetPlayerName(playerid, PlayerName, sizeof(PlayerName));
    new year, month, day; // We want to know the date that the user got kicked, right?
    getdate(year, month, day); // Now we know the real date because of this handy function.
    { // Then...
    new text[128]; // Length of the text (128 characters)
    new File:log = fopen("KickEx.txt", io_write); // Open the file.
    format(text, sizeof(text), "[%d/%d/%d] %s kicked for: %s\r\n",day,month,year,PlayerName,reason); // Displayed in the file.
    fwrite(log, text); // Write to the file.
    fclose(log); // Close the file.
    NewLine();
    Kick(playerid); // Kick the player.
} // Curly brace to close the script.
    return 1;
}

public NewLine()
{
    new File:hFile;
    hFile = fopen("KickEx.txt", io_append);
    fwrite(hFile, "\n");
    fclose(hFile);
}