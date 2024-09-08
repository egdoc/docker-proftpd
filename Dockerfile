FROM docker.io/debian:stable

LABEL maintainer="Egidio Docile"

ENV FTP_USER=user
ENV FTP_PASS=pass
ENV UID=1000

RUN apt-get update && apt-get install -y proftpd proftpd-mod-crypto

RUN useradd -m -u "${UID}" "${FTP_USER}"

COPY proftpd.conf /etc/proftpd
COPY entrypoint.sh /

EXPOSE 20/tcp 21/tcp 40000-40009/tcp

ENTRYPOINT ["/entrypoint.sh"]
