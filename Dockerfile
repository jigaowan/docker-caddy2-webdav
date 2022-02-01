FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/jigaowan/caddy-webdav

FROM caddy:latest

RUN rm -r /data/caddy

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
