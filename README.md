# Hytale Downloader Docker

Docker image for the Hytale downloader application.

## Usage

```bash
docker run --rm -v $(pwd):/data voidcube/hytale-downloader
```

## Building

```bash
docker build -t hytale-downloader \
  --build-arg HYTALE_DOWNLOADER_URL=<url-to-downloader> \
  .
```

## License

MIT
