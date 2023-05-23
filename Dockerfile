FROM ich777/debian-baseimage

LABEL org.opencontainers.image.authors="admin@minenet.at"
LABEL org.opencontainers.image.source="https://github.com/ich777/docker-rustdesk-server-aio"

ARG HBBS_V="template"
ARG HBBR_V="template"

RUN apt-get update && \
	wget -O /tmp/hbbs.deb https://github.com/rustdesk/rustdesk-server/releases/download/${HBBS_V}/rustdesk-server-hbbs_${HBBS_V%-*}_amd64.deb && \
	wget -O /tmp/hbbr.deb https://github.com/rustdesk/rustdesk-server/releases/download/${HBBR_V}/rustdesk-server-hbbr_${HBBR_V%-*}_amd64.deb && \
	apt-get -y install /tmp/hbbs.deb /tmp/hbbr.deb && \
	rm -rf /tmp/hbbs.deb /tmp/hbbr.deb /var/lib/apt/lists/*

ENV DATA_DIR="/rustdesk-server"
ENV HBBS_ENABLED="true"
ENV HBBR_ENABLED="true"
ENV HBBS_PARAMS=""
ENV HBBR_PARAMS=""
ENV UMASK=000
ENV UID=99
ENV GID=100
ENV USER="rustdesk"
ENV DATA_PERM=770

RUN mkdir $DATA_DIR && \
	useradd -d $DATA_DIR -s /bin/bash $USER && \
	chown -R $USER $DATA_DIR && \
	ulimit -n 2048

ADD /scripts/ /opt/scripts/
RUN chmod -R 770 /opt/scripts/

#Server Start
ENTRYPOINT ["/opt/scripts/start.sh"]
