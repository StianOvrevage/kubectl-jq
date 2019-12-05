FROM alpine:3.10

ARG VCS_REF
ARG BUILD_DATE

# Metadata
LABEL org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.name="helm-kubectl" \
      org.label-schema.url="https://hub.docker.com/r/StianOvrevage/kubectl-jq" \
      org.label-schema.vcs-url="https://github.com/StianOvrevage/kubectl-jq" \
      org.label-schema.build-date=$BUILD_DATE

# Note: Latest version of kubectl may be found at:
# https://github.com/kubernetes/kubernetes/releases
ENV KUBE_VERSION="v1.16.2"

RUN apk add --no-cache ca-certificates bash curl jq \
    && wget -q https://storage.googleapis.com/kubernetes-release/release/${KUBE_VERSION}/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl

WORKDIR /config

CMD bash
