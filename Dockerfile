ARG DOWNLOADER_IMAGE=alpine/curl
ARG BASE_IMAGE=scratch

FROM ${DOWNLOADER_IMAGE} AS downloader

ARG HYTALE_DOWNLOADER_URL

WORKDIR /tmp

RUN apk update && apk add unzip && \
    curl -o hytale_downloader.zip ${HYTALE_DOWNLOADER_URL} && \
    unzip hytale_downloader.zip

FROM ${BASE_IMAGE} AS final

ARG HYTALE_DOWNLOADER_PLATFORM="linux-amd64"
ARG IMAGE_VERSION

COPY --from=downloader /tmp/hytale-downloader-${HYTALE_DOWNLOADER_PLATFORM} /bin/hytale-downloader

ENTRYPOINT [ "/bin/hytale-downloader" ]

LABEL org.opencontainers.image.title="Hytale Downloader" \
      org.opencontainers.image.description="Docker image for Hytale downloader application" \
      org.opencontainers.image.version="${IMAGE_VERSION}" \
      org.opencontainers.image.authors="Petr Václavek petr@vaclavek.cloud" \
      org.opencontainers.image.url="https://github.com/voidcubedotgg/hytale-downloader-docker" \
      org.opencontainers.image.source="https://github.com/voidcubedotgg/hytale-downloader-docker" \
      org.opencontainers.image.licenses="MIT"