# youtube-dl_script
Windows Powershell script file with template config files for archiving YouTube channels locally.

## How To Get This Working
Before you do anything, please be aware that this script is made for Windows as it is a Powershell script file. The config files and folder structure will be the same on a Linux machine, but you will have to make your own shell script or something similar. It should end up very similar to the one here.

Once you are ready, follow these steps:
1. Download/clone this repository. The easiest way to do this is to go to **Code** above, then click **Download ZIP**.
2. Find a location where you want to store your archive. For me, this is on my NAS in 'Videos/Youtube'. Extract (if needed), and place the contents of this repository there. Using my example, my folder structure would look like:
    *Videos/Youtube/zzz_ytdl_settings
    *Videos/Youtube/youtube-dl-scripts.ps1
3. Download yt-dlp and ffmpeg and place them into the folder next to the script file. As long as youtube-dl is working, you can also use this, but you will have to fix the script file to not use yt-dlp. However, I **__highly__** recommend making the switch to yt-dlp. See the **Links** section below for links to these. Your folder structure should now be:
    *Videos/Youtube/zzz_ytdl_settings
    *Videos/Youtube/youtube-dl-scripts.ps1
    *Videos/Youtube/yt-dlp.exe
    *Videos/Youtube/ffmpeg.exe
4. Configure the files in 'zzz_ytdl_settings' to your needs! Feel free to add/remove/modify these files however you see fit. Unless you really know what you're doing, I'd recommend leaving the '.conf' files alone **__except to add specific playlists that shouldn't be downloaded!__** See the section below on how to accomplish this. The main thing you will need to modify is the 'ChannelList' files. I've left in a few examples of channels I back up in order to give you an idea on how I keep things organized. Keep in mind that the # character at the start of a line denotes a comment and the script will ignore that line.
5. **__IMPORTANT!__** Set up automation. Even if you want to manually run this script, please read this carefully. As is, this script is expecting the 'youtube-dl_script.ps1' file to be located directly in the 'Z:' drive. 

## Misc Info
#### Config Files
This script is designed to use separate config files, which helps keep the main batch file cleaner and easier to make changes later. By no means are you stuck to only the ones provided here, just follow these as a template. I have also removed most of the channels I archive so you won't have to go through and delete them all, but I did leave a few in here and there as an example.
#### Folder/File Names
With the current configuration the folder and file names are quite long and may be a little messy for your taste. This can be customized in the config files in the section with the -o argument. The reason I have things named like this is for any potential programs in the future that may need to scan the file names to figure out what channels, playlists, and videos you already have. There is a good chance whatever this program would be wouldn't need the unique IDs for all of these, but I'm playing it safe. Just a word of warning though, Windows has a pretty short default max directory length, which may be a problem even if you don't use my naming conventions. Please use Google to figure out how to fix this.
#### Settings Folder Name
You can change this to whatever you want, just be sure to update the batch file to reflect those changes. I have the folder name start with 'zzz' in order to keep it at the bottom of the file browser.
#### Playlist Filtering
Sometimes a channel will have playlists that are quite annoying to deal with. For example, it may have a playlist that the channel owner puts every video they make into as well as adding them to other playlists. In the config files I currently only have it filtering out playlists named 'liked videos' and 'favorites' since those are common ones I don't want to archive, but if you want to filter out specific playlists I've had better luck filtering out by playlist ID instead of by name. Please read the youtube-dl documentation in order to better understand what all you can do here, but just as an example of what you need to add to the config file, here is the --match-filter line modified to filter out a specific playlist (remove the outer quotes if you copy this): "--match-filter "playlist_title != 'Liked videos' & playlist_title != 'Favorites' & playlist_id != 'PLQDcEvx09tHGnoesAV_gy2wS9jf2R3uA8'"".

## Links
yt-dlp: #########
ffmpeg: #########

yt-dlp documentation in case you need to modify the config files: ########

For a similar project (and one that will be better maintained than this one), check out TheFrenchGhosty's project: https://github.com/TheFrenchGhosty/TheFrenchGhostys-YouTube-Archivist-Scripts

## Future Plans
This is now the 3rd or 4th iteration of my setup and I am extremly happy with how it works now. However, if I make any major changes, I'll try my best to update this repository.

## Changelog
02-27-2022: Updated repository to v2, which swapped youtube-dl to yt-dlp and made some fairly significant improvements to the config files. Namely, vastly improving runtime when it comes to handling filtered playlists, and fixing channel folder naming, which should no longer create 2 separate channel folders when downloading playlists and no playlists. Also switched from a batch file to a Powershell script.
