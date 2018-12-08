FROM opendevsecops/launcher:latest as launcher

# ---

FROM alpine:latest

WORKDIR /run

RUN true \
    && apk --no-cache add \
        git \
		perl \
		perl-net-ssleay

RUN true \
    && git clone https://github.com/sullo/nikto.git

COPY --from=launcher /bin/launcher /bin/launcher

ENTRYPOINT ["/bin/launcher", "/usr/bin/perl", "/run/nikto/program/nikto.pl"]
