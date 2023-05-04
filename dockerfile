FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository universe && \
    apt-get update && \
    apt-get install -y minidlna

COPY minidlna.conf /etc/minidlna.conf

VOLUME ["/var/lib/minidlna"]

EXPOSE 8200 1900/udp

CMD ["minidlnad", "-d"]

