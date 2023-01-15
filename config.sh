#!/bin/bash

# The file to play when the stream is offline, should be full path, and must be readable by nginx
# The file should have the same resolution and bitrate as your actual stream
offfi="/media/FILLER.mov"

# Should be some random unguessable string, this will be your stream key for streamRIP
secret="video"

# The RTMP endpoint, ie: your Twitch RTMP link
rtmpe="rtmp://127.0.0.1/output/$secret"

# The RTMP ingest stream, you probaly don't need to change this if you're using streamRIP nginx config
rtmpi="rtmp://127.0.0.1/live/$secret"

# The RTMP ingest stream, you probaly don't need to change this if you're using streamRIP nginx config
rtmphls="http://127.0.0.1/hls/$secret.m3u8"

###############
# Don't touch #
###############
wd=/tmp/streamrip
pfi=$wd/streamrip
offpidfi=$wd/offline_pid
onpidfi=$wd/online_pid
inpidfi=$wd/input_pid
offlo=$wd/offline_lock
onlo=$wd/online_lock
inlo=$wd/input_lock