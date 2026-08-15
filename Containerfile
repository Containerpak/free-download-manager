FROM ubuntu:26.04 AS source

ADD --checksum=sha256:299c5bef180b578ae223e03a108279c3b80ec7f9bce3e1792469d46dee2fc6cd https://files2.freedownloadmanager.org/6/latest/freedownloadmanager.deb /tmp/app.deb

FROM ghcr.io/containerpak/gtk3:main

LABEL org.opencontainers.image.source="https://github.com/Containerpak/free-download-manager"

RUN --mount=type=bind,from=source,source=/tmp/app.deb,target=/run/app.deb \
    apt-get update && \
    apt-get install -y --no-install-recommends /run/app.deb && \
    ln -sf /opt/freedownloadmanager/fdm /usr/bin/fdm && \
    cpak-clean-junk

COPY icon.png /usr/share/icons/hicolor/128x128/apps/free-download-manager.png
COPY free-download-manager.desktop /usr/share/applications/free-download-manager.desktop
