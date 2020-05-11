# youtube-dl_script
Windows batch file with template config files for archiving YouTube channels.

## How To Get This Working
First of all, this script is made for Windows as it is a batch file. The config files and folder structure will be the same on a Linux machine, but you will have to make your own shell script or something similar. 

Second, the batch file provided here is the exact one I use, and I have a Windows VM running on my NAS, and everything gets downloaded to the NAS storage (which is running unRAID). As such, I have the contents of this repository on the NAS itself, then using Windows scheduler I have the VM run a batch file whose only job is to run the main batch file on my NAS. I know that seems a little convoluted, but it was the only way I could find to keep the script file on my NAS, but use it in the VM. You probably won't need to bother with this, the only reason I have it that way is to modify the script from whatever computer I want, but I set this up a long time ago before I simplified the batch file by separating the config files. If your setup is simpler you will probably want to remove a couple sections from the batch file that are used to mount and unmount the SMB share. These sections are labeled in the file. 

Third, you should change the config files to fit your needs, and add whatever channels you wish to archive to the channel list files.

Lastly, you will need to download youtube-dl and ffmpeg and place them into the same folder as the batch file. Then you can run the batch file.

## Misc Info
#### Config Files
This script is designed to use separate config files, which helps keep the main batch file cleaner and easier to make changes later. By no means are you stuck to only the ones provided here, just follow these as a template. I have also removed most of the channels I archive so you won't have to go through and delete them all, but I did leave a few in here and there as an example.
#### Folder/File Names
With the current configuration the folder and file names are quite long and may be a little messy for your taste. This can be customized in the config files in the section with the -o argument. The reason I have things named like this is for any potential programs in the future that may need to scan the file names to figure out what channels, playlists, and videos you already have. There is a good chance whatever this program would be wouldn't need the unique IDs for all of these, but I'm playing it safe. Just a word of warning though, Windows has a pretty short default max directory length, which may be a problem even if you don't use my naming conventions. Please use Google to figure out how to fix this.
#### Settings Folder Name
You can change this to whatever you want, just be sure to update the batch file to reflect those changes. I have the folder name start with 'zzz' in order to keep it at the bottom of the file browser.
#### Playlist Filtering
Sometimes a channel will have playlists that are quite annoying to deal with. For example, it may have a playlist that the channel owner puts every video they make into as well as adding them to other playlists. In the config files I currently only have it filtering out playlists named 'liked videos' and 'favorites' since those are common ones I don't want to archive, but if you want to filter out specific playlists I've had better luck filtering out by playlist ID instead of by name. Please read the youtube-dl documentation in order to better understand what all you can do here, but just as an example of what you need to add to the config file, here is the --match-filter line modified to filter out a specific playlist (remove the outer quotes if you copy this): "--match-filter "playlist_title != 'Liked videos' & playlist_title != 'Favorites' & playlist_id != 'PLQDcEvx09tHGnoesAV_gy2wS9jf2R3uA8'"".

## Other Resources
Please check out the youtube-dl documentation: https://github.com/ytdl-org/youtube-dl

For a similar project (and one that will be better maintained than this one), check out TheFrenchGhosty's project: https://github.com/TheFrenchGhosty/TheFrenchGhostys-YouTube-Archivist-Scripts

## Future Plans
Many people have asked me if I plan on improving upon this and making something with a UI kind of like Sonarr/Radarr. To that I would say I would love to, but I have very little programming experience pertaining to that kind of development. That said, I have been taking an interest in it lately, but IF (NOT when) it ever happens, it would be awhile out and would probably never be as polished and nice as Sonarr and the like. There is just so much to figure out and not enough time to learn. 
