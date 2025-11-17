FROM debian:bookworm-slim

# Basis-Tools
RUN apt-get update && apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    && rm -rf /var/lib/apt/lists/*

# Dein Setup-Script ausführen (Paketquellen erweitern)
# Den Link ersetzt du durch deinen echten
RUN curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | bash

# Danach kannst du aus den neuen Quellen installieren
RUN apt-get update && apt-get install -y \
    speedtest \
    && rm -rf /var/lib/apt/lists/*

CMD ["speedtest", "--accept-license", "--accept-gdpr"]