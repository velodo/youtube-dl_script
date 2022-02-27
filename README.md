# youtube-dl_script
Windows Powershell script file with template config files for archiving YouTube channels locally.

## How To Get This Working
Before you do anything, please be aware that this script is made for Windows as it is a Powershell script file. The config files and folder structure will be the same on a Linux machine, but you will have to make your own shell script or something similar. It should end up very similar to the one here.

Once you are ready, follow these steps:
1. Download/clone this repository. The easiest way to do this is to go to **Code** above, then click **Download ZIP**.
2. Find a location where you want to store your archive. For me, this is on my NAS in 'Videos/Youtube'. Extract (if needed), and place the contents of this repository there. Using my example, my folder structure would look like:
    * Videos/Youtube/zzz_ytdl_settings
    * Videos/Youtube/youtube-dl-scripts.ps1
3. Download yt-dlp and ffmpeg and place them into the folder next to the script file. As long as youtube-dl is working, you can also use this, but you will have to fix the script file to not use yt-dlp. However, I **__highly__** recommend making the switch to yt-dlp. See the **Links** section below for links to these. Your folder structure should now be:
    * Videos/Youtube/zzz_ytdl_settings
    * Videos/Youtube/youtube-dl-scripts.ps1
    * Videos/Youtube/yt-dlp.exe
    * Videos/Youtube/ffmpeg.exe
4. Configure the files in 'zzz_ytdl_settings' to your needs. Feel free to add/remove/modify these files however you see fit. Unless you really know what you're doing, I'd recommend leaving the '.conf' files alone **__except to add specific playlists that shouldn't be downloaded!__** See the section below on how to accomplish this. The main thing you will need to modify is the 'ChannelList' files. I've left in a few examples of channels I back up in order to give you an idea on how I keep things organized. Keep in mind that the # character at the start of a line denotes a comment and the script will ignore that line.
5. Set up automation. If you plan on running this manually, feel free to ignore this. However, if your like me, you want this to automatically run on a schedule. If using linux, set up a cron job for this, if on windows, use Task Scheduler. One thing to note if you're using a NAS like I am, you may want to mount your 'Youtube' folder containing the script file to a drive letter first. I have mine set to automatically mount on startup to the drive letter 'Z:'. If you do this, please modify the 'Change Directory' section of the script to whatever drive letter you choose, then uncomment the `cd [DRIVE LETTER]`. I won't walk you through every step of setting up Task Scheduler, but for the action you will want to set the action to 'Start a program', the program should be `powershell`, and arguments should be `-file Z:/youtube-dl-script.ps1` (replace the Z with whatever you chose earlier). For triggers, I personally set it to run every night at 1AM and also 1PM on days I'm at work.
6. Give it a test run! One thing I might recommend if you care a lot about keeping playlists orgainzed, is to comment out all of the non playlist yt-dlp commands in the script file for at least the first few full runs of the script. This will ensure any downloads that fail in the playlist portion of the script aren't then downloaded immediately after by the non playlist portion of the script. This doesn't help later on when a creator adds a video to a playlist after you've already archived it, but there isn't much you can do about that unless you write a separate program to take care of that. 

## Misc Info
#### Filtering Specific Playlists
In each of the playlist config files I have already set up filtering for playlists titled 'liked videos' and 'favorites' (as well as filtering out currently streaming livestreams). This is to try to not download videos that a creator didn't make themselves. You may choose to remove or add to these. If you do, just modify the following line in the config files: `--match-filter "!is_live & title != 'Liked videos' & title != 'Favorites'"` for playlist config files and `--match-filter "!is_live & title != 'Liked videos' & title != 'Favorites'"` for non-playlist config files. Also note that if there are specific channels you want to have general filters set up for and ones that you don't, you can just add another set of config files, channel list files, and add another couple lines to the script file and you can do exactly that. Some filters you may find useful:
```
!is_live                        - Filters videos that are currently streaming live
title != '[PLAYLIST TITLE]'     - Filters playlists with that title
id != '[PLAYLIST ID]'           - Filters a specific playlist
duration < [SECONDS]            - Filters videos longer than the duration in seconds
```
There are many more options for filtering, these are just a few useful examples.
#### Config Files
This script is designed to use separate config files, which helps keep the main batch file cleaner and easier to make changes later. By no means are you stuck to only the ones provided here, just follow these as a template. I have also removed most of the channels I archive so you won't have to go through and delete them all, but I did leave a few in here and there as an example.
#### Folder/File Names
With the current configuration the folder and file names are quite long and may be a little messy for your taste. This can be customized in the config files in the section with the -o argument. The reason I have things named like this is for any potential programs in the future that may need to scan the file names to figure out what channels, playlists, and videos you already have. There is a good chance whatever this program would be wouldn't need the unique IDs for all of these, but I'm playing it safe. Just a word of warning though, Windows has a pretty short default max directory length, which may be a problem even if you don't use my naming conventions. Please use Google to figure out how to fix this, but also note, that I've had this issue in the past and couldn't figure out how to actually fix it, but I also don't care much as very few videos can't be downloaded because of this limitation.
#### Settings Folder Name
You can change this to whatever you want, just be sure to update the script file to reflect those changes. I have the folder name start with 'zzz' in order to keep it at the bottom of the file browser.

## Links
yt-dlp: https://github.com/yt-dlp/yt-dlp
ffmpeg: https://ffmpeg.org/download.html

yt-dlp documentation in case you need to modify the config files: https://github.com/yt-dlp/yt-dlp#usage-and-options

For a similar project (and one that will be better maintained than this one), check out TheFrenchGhosty's project: https://github.com/TheFrenchGhosty/TheFrenchGhostys-Ultimate-YouTube-DL-Scripts-Collection

## Future Plans
This is now the 3rd or 4th iteration of my setup and I am extremly happy with how it works now. However, if I make any major changes, I'll try my best to update this repository.

## Changelog
02-27-2022: Updated repository to v2, which swapped youtube-dl to yt-dlp and made some fairly significant improvements to the config files. Namely, vastly improving runtime when it comes to handling filtered playlists, and fixing channel folder naming, which should no longer create 2 separate channel folders when downloading playlists and no playlists. Also switched from a batch file to a Powershell script.
