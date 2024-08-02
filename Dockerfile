FROM docker.io/bitnami/kubectl:1.28.10

# hadolint ignore=DL3002,DL3006
USER 0

# hadolint ignore=DL3008
RUN apt-get update \
  && apt-get install --no-install-recommends -y \
    curl \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN addgroup --gid 2008 app \
  && adduser \
    --uid 2008 \
    --home /home/app \
    --shell /bin/ash \
    --ingroup app \
    --disabled-password \
    app

USER 10001
