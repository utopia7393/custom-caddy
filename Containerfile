FROM caddy:2.11.2-builder AS builder

RUN xcaddy build \
    --with github.com/corazawaf/coraza-caddy/v2 \
    --with github.com/WeidiDeng/caddy-cloudflare-ip \
    --with github.com/hslatman/caddy-crowdsec-bouncer \
    --with github.com/mholt/caddy-l4

FROM caddy:2.11.2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
