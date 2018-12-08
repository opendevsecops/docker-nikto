FROM alpine:latest as build

WORKDIR /build

RUN true \
	&& apk --no-cache add \
		git

RUN true \
	&& git clone --depth 1 https://github.com/sullo/nikto.git

# ---

FROM opendevsecops/launcher:latest as launcher

# ---

FROM alpine:latest

WORKDIR /run

RUN true \
	&& apk --no-cache add \
		perl \
		perl-net-ssleay

COPY --from=build /build/nikto /run/nikto

COPY --from=launcher /bin/launcher /bin/launcher

WORKDIR /session

ENTRYPOINT ["/bin/launcher", "perl", "/run/nikto/program/nikto.pl"]
