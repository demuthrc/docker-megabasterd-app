FROM delitescere/jdk
LABEL maintainer "Jairo Quispe <jairo.quispe.03@gmail.com>"

ENV HOME /home/mega

RUN apk add --update --no-cache libxi \
	libxext \
	libxrender \
	libxtst \
	fontconfig \
	ttf-dejavu && \
  	rm -rf /tmp/* /var/cache/apk/*
RUN mkdir -p $HOME && \
	wget https://github.com/tonikelope/megabasterd/releases/download/v7.42/MegaBasterd_7.42.jar -O /home/Megabasterd.jar && \
	chmod 777 /home/Megabasterd.jar && chown -R 0:0 /home
WORKDIR $HOME
ENTRYPOINT ["java","-jar"]
CMD ["/home/Megabasterd.jar"] 

# docker build . -t megabasterd

# docker run -e DISPLAY=$DISPLAY -v /tmp/.X11-unix/:/tmp/.X11-unix/ -v /docker/mega:/home/mega megabasterd -v :/mnt/omv/downloads:/home/storage
