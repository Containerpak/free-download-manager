FROM ghcr.io/containerpak/gtk3:main

LABEL org.opencontainers.image.source="https://github.com/Containerpak/free-download-manager"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    bubblewrap ffmpeg libxcb-cursor0 libxcb-icccm4 libxcb-keysyms1 \
    libxkbcommon-x11-0 openssl xdg-utils && \
    ln -sf /opt/freedownloadmanager/fdm /usr/bin/fdm && \
    cpak-clean-junk

COPY icon.png /usr/share/icons/hicolor/128x128/apps/free-download-manager.png
COPY free-download-manager.desktop /usr/share/applications/free-download-manager.desktop
