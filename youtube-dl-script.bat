:::::::::::::::::::::::::::::::::::::::::::::::::
::				YOUTUBE-DL SCRIPT			   ::
:::::::::::::::::::::::::::::::::::::::::::::::::


:::: CMD Trickery ::::
::COMMENT OUT THIS SECTION AS WELL AS LAST SECTION IF SCRIPT FILE IS NOT LOCATED ON A SMB SHARE::
pushd %~dp0
cd %~dp0


:::: Update ::::

youtube-dl --update
timeout /t 30 /nobreak
cls


:::: Channel Download ::::

::Playlists
youtube-dl --config-location "zzz_ytdl_settings/Args_Channel_4k_Playlist.conf" -a "zzz_ytdl_settings/ChannelList_4k_Playlist.txt"
youtube-dl --config-location "zzz_ytdl_settings/Args_Channel_1080_Playlist.conf" -a "zzz_ytdl_settings/ChannelList_1080_Playlist.txt"
youtube-dl --config-location "zzz_ytdl_settings/Args_Channel_720_Playlist.conf" -a "zzz_ytdl_settings/ChannelList_720_Playlist.txt"
youtube-dl --config-location "zzz_ytdl_settings/Args_Channel_Audio_Playlist.conf" -a "zzz_ytdl_settings/ChannelList_Audio_Playlist.txt"
::No Playlists
youtube-dl --config-location "zzz_ytdl_settings/Args_Channel_4k_NoPlaylist.conf" -a "zzz_ytdl_settings/ChannelList_4k_NoPlaylist.txt"
youtube-dl --config-location "zzz_ytdl_settings/Args_Channel_1080_NoPlaylist.conf" -a "zzz_ytdl_settings/ChannelList_1080_NoPlaylist.txt"
youtube-dl --config-location "zzz_ytdl_settings/Args_Channel_720_NoPlaylist.conf" -a "zzz_ytdl_settings/ChannelList_720_NoPlaylist.txt"
youtube-dl --config-location "zzz_ytdl_settings/Args_Channel_Audio_NoPlaylist.conf" -a "zzz_ytdl_settings/ChannelList_Audio_NoPlaylist.txt"


:::: Liked Videos ::::

::---TEMPORARILY DISABLED TO ENSURE ALL PLAYLISTS ARE FINISHED FIRST!!!---
::youtube-dl --config-location "zzz_ytdl_settings/Args_LikedVideos.conf" "!!!LINK HERE TO LIKED VIDEOS PLAYLIST!!!"


:::: Release SMB Mount ::::
popd
