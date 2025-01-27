# docker-debian-sftp

GitHub: https://github.com/nicolaimainiero/docker-debian-sftp<br/>
DockerHub: https://hub.docker.com/repository/docker/nmainiero/docker-debian-sftp

# What is it?
Docker-debian-sftp is a Docker container running sftp server.
Not only you get isolation from the side of Docker, but also there is chroot in sshd_config set-up. <br/>

# How to use it?
While in main directory of this repo, you can simply execute command: `docker-compose up -d` or copy content of my *docker-compose.yml*:

``` yml
version: '3.3'

services:
    debian-sftp:
        image: naminiero/docker-debian-sftp:latest
        restart: unless-stopped
        hostname: debian-sftp
        container_name: debian-sftp
        ports:
            - "2800:22"
        stdin_open: true
        tty: true
        volumes: 
            - /path/you/want/to/use:/home

```

## Remember, change mount point, or delete it completely if you don't want to mount anything

Remember to change line: ` - /path/you/want/to/use:/home`, so the files from *debian-sftp* container get mounted in a place you want. It is good to mount in case something happens to container, if so you still have access to all files located in this container.

## How to create users?
I wrote a simple script called *user_add.sh*, which creates users and sets proper permission for their files. <br/>
If you want to use it, you can execute command from your host OS: `docker exec -it debian-sftp user_add`, write user name and password when asked to do so. Another way is to get inside container (e. g. `docker exec -it debian-sftp bash`) and there execute `user_add`. <br/>
Please, read my script to know what permissions are set by it.

# Can I customise it for my needs?
Of course, if you want to change something, for example in *sshd_config*, do it and then build the image yourself. In directory *build_it_yourself* you have everything needed to customise and build the image. <br/>
To build the image, execute command: `docker build -t *name of your image* .` while you're inside *build_it_yourself* directory.

# SSH Host Key generated with

RSA: `ssh-keygen -f ssh_host_rsa_key  -t rsa -b 4096 -C "root@buildkitsandbox"`
ECDSA: `ssh-keygen -f ssh_host_ecdsa_key  -t ecdsa -C "root@buildkitsandbox"`
ED25519: `ssh-keygen -f ssh_host_ed25519_key  -t ed25519 -C "root@buildkitsandbox"`

No passphrase is set.