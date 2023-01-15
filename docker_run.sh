docker stop streamrip-$1
docker run -d --rm --name streamrip-$1 --mount type=tmpfs,destination=/mnt/hls -p $1:1935 -v $2:/media -it streamrip