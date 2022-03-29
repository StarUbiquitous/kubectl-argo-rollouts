FROM alpine:latest

ARG VERSION="1.2.0"

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh && \
    apk add --no-cache --update openssl curl ca-certificates && \
    curl -L https://github.com/argoproj/argo-rollouts/releases/download/v$VERSION/kubectl-argo-rollouts-linux-amd64 -o /usr/local/bin/kubectl-argo-rollouts && \
    chmod +x /usr/local/bin/kubectl-argo-rollouts && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/entrypoint.sh"]
CMD ["version"]