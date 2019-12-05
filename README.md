# kubectl-jq Docker image

Forked from https://github.com/dtzar/helm-kubectl

Changes:
 - Removed helm
 - Removed git and openssh
 - Added jq via `apk add`

Resulting image is down from 115MB to 59MB compared to `dtzar/helm-kubectl`.

## Build

    make docker_build

## Publish

    make docker_push