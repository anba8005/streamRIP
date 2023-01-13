FROM ubuntu:jammy

USER root

RUN sed -i -e 's/http:\/\/archive\.ubuntu\.com\/ubuntu\//mirror:\/\/mirrors\.ubuntu\.com\/mirrors\.txt/' /etc/apt/sources.list

RUN apt-get update -qqy \
	&& apt-get install -y nginx-light libnginx-mod-rtmp ffmpeg \
	&& rm -rf /var/lib/apt/lists/* /var/cache/apt/*

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

RUN mkdir /usr/share/nginx/streamRIP/

COPY streamrip.conf /etc/nginx/nginx.conf
COPY *.sh /usr/share/nginx/streamRIP

EXPOSE 1935

STOPSIGNAL SIGQUIT

CMD ["nginx", "-g", "daemon off;"]
