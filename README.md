# docker-proftpd 

A simple FTP server, using
[`proftpd`](https://www.proftpd.org)

## How to use this image

### start a FTP Server instance

To start a container, with data stored in `/data` on the host, use the
following:

```sh
docker run \
  --detach \
  --env FTP_USER=user \
  --env FTP_PASS=123 \
  --publish 20-21:20-21/tcp \
  --publish 40000-40009:40000-40009/tcp \
  --volume /data:/home/user \
  egdoc/docker-proftpd
```

### ... via `docker compose`

```yml
services:
  ftp-server:
    image: egdoc/docker-proftpd
    environment:
      - FTP_PASS=123
      - FTP_USER=user
    ports:
      - '20-21:20-21/tcp'
      - '40000-40009:40000-40009/tcp'
    volumes:
      - '/data:/home/user'
```

## License

-   This image is released under the
    [GPLv3 License](https://raw.githubusercontent.com/egdoc/docker-proftpd/master/LICENSE).
