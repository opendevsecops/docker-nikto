FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

RUN true \
    && apt-get update \
    && apt-get install -y \
        git \
        perl \
    && apt-get clean

WORKDIR /

RUN git clone https://github.com/sullo/nikto.git

ENTRYPOINT ["/nikto/program/nikto.pl"]

CMD ["-Help"]
