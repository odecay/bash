#!/bin/bash

#a script to make a .m3u playlist of files recently added to a directory
#I use it after I add some new files to my music directory to make a playlist for use in mpd
date=$(date +"%m-%d-%y")
music_directory=~/music
playlist_directory=~/.mpd/playlists
playlist_name=recently_added_$date
ten_latest=$(ls -t $music_directory | head)

while IFS= read -r line
do
	find $music_directory/"$line" -name "*.mp3" -o -name "*.m4a" -o -name "*.flac" -type f >> $playlist_directory/$playlist_name.m3u
done <<< "$ten_latest"
