
FROM archlinux:latest

RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm curl unzip tar git borg cronie rsync

COPY setup.sh /scripts/setup.sh
RUN chmod +x /scripts/setup.sh
RUN /scripts/setup.sh


COPY setup.sh /scripts/start.sh
RUN chmod +x /scripts/start.sh
RUN /scripts/start.sh

WORKDIR /minecraft

EXPOSE 19132/udp

# CMD ["/scripts/start.sh"]
CMD ["/minecraft/bedrock_server"]
