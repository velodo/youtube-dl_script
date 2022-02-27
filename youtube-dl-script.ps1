##################################
##		YOUTUBE-DL SCRIPT		##
##################################


## Change Directory ##

#---UNCOMMENT AFTER YOU CUSTOMIZE, READ README FOR MORE INFO---
#cd Z:/


## Update ##

./yt-dlp --update


## Channel Download ##

#Playlists
./yt-dlp --config-location "zzz_ytdl_settings/Args_Channel_4k_Playlist.conf" -a "zzz_ytdl_settings/ChannelList_4k_Playlist.txt"
./yt-dlp --config-location "zzz_ytdl_settings/Args_Channel_1080_Playlist.conf" -a "zzz_ytdl_settings/ChannelList_1080_Playlist.txt"
./yt-dlp --config-location "zzz_ytdl_settings/Args_Channel_720_Playlist.conf" -a "zzz_ytdl_settings/ChannelList_720_Playlist.txt"
./yt-dlp --config-location "zzz_ytdl_settings/Args_Channel_Audio_Playlist.conf" -a "zzz_ytdl_settings/ChannelList_Audio_Playlist.txt"
#No Playlists
./yt-dlp --config-location "zzz_ytdl_settings/Args_Channel_4k_NoPlaylist.conf" -a "zzz_ytdl_settings/ChannelList_4k_NoPlaylist.txt"
./yt-dlp --config-location "zzz_ytdl_settings/Args_Channel_1080_NoPlaylist.conf" -a "zzz_ytdl_settings/ChannelList_1080_NoPlaylist.txt"
./yt-dlp --config-location "zzz_ytdl_settings/Args_Channel_720_NoPlaylist.conf" -a "zzz_ytdl_settings/ChannelList_720_NoPlaylist.txt"
./yt-dlp --config-location "zzz_ytdl_settings/Args_Channel_Audio_NoPlaylist.conf" -a "zzz_ytdl_settings/ChannelList_Audio_NoPlaylist.txt"


## Liked Videos ##

#---UNCOMMENT AFTER YOU ADD LINK BELOW!!---
#youtube-dl --config-location "zzz_ytdl_settings/Args_LikedVideos.conf" [*LINK TO YOUR CHANNELS LIKED VIDEOS PLAYLIST HERE (make sure it's not set to private)*]
