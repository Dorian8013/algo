FROM python:3-alpine

ARG VERSION="git"
ARG PACKAGES="bash libffi openssh-client openssl rsync tini"
ARG BUILD_PACKAGES="gcc libffi-dev linux-headers make musl-dev openssl-dev"

LABEL name="ralgo" \
      version="${VERSION}" \
      description="Set up a personal WireGuard VPN in the cloud" \
      maintainer="rhdsx <http://github.com/rhdsx/ralgo>"

RUN apk --no-cache add ${PACKAGES}
RUN adduser -D -H -u 19857 ralgo
RUN mkdir -p /ralgo && mkdir -p /ralgo/configs

WORKDIR /ralgo
COPY requirements.txt .
RUN apk --no-cache add ${BUILD_PACKAGES} && \
    python3 -m pip --no-cache-dir install -U pip && \
    python3 -m pip --no-cache-dir install virtualenv && \
    python3 -m virtualenv venvs/.env && \
    source venvs/.env/bin/activate && \
    python3 -m pip --no-cache-dir install -r requirements.txt && \
    apk del ${BUILD_PACKAGES}
COPY . .
RUN chmod 0755 /ralgo/ralgo-docker.sh

# Because of the bind mounting of `configs/`, we need to run as the `root` user
# This may break in cases where user namespacing is enabled, so hopefully Docker
# sorts out a way to set permissions on bind-mounted volumes (`docker run -v`)
# before userns becomes default
# Note that not running as root will break if we don't have a matching userid
# in the container. The filesystem has also been set up to assume root.
USER root
CMD [ "/ralgo/ralgo-docker.sh" ]
ENTRYPOINT [ "/sbin/tini", "--" ]
