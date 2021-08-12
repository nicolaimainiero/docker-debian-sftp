FROM debian:stable-slim

LABEL author "Nicolai Mainiero"

RUN \
apt update && \
apt upgrade -y
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin
RUN apt install -y tzdata openssh-server openssh-sftp-server acl && \
groupadd sftp-users && mkdir /workdir

COPY entrypoint.sh /workdir/

COPY default_user.sh /usr/local/bin/
RUN rm /etc/ssh/sshd_config && mv /usr/local/bin/default_user.sh /usr/local/bin/default_user && \
chmod 755 /workdir/entrypoint.sh \
&& chmod 755 /usr/local/bin/default_user
RUN /usr/local/bin/default_user

COPY sshd_config /etc/ssh/
COPY ./keys/*_key /etc/ssh/

WORKDIR /workdir
CMD ./entrypoint.sh
EXPOSE 22