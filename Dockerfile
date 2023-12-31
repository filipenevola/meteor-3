FROM zcloudws/meteor-build:3.0-alpha.11 as builder

WORKDIR /build/source
USER root

RUN chown zcloud:zcloud -R /build

USER zcloud
COPY --chown=zcloud:zcloud . /build/source

ENV METEOR_DISABLE_OPTIMISTIC_CACHING=1

RUN meteor npm --no-audit install && meteor build --platforms web.browser,web.cordova --directory ../app-build

FROM zcloudws/meteor-node-runtime:3.0-alpha.11
COPY --from=builder /build/app-build/bundle /home/zcloud/app

RUN cd /home/zcloud/app/programs/server && npm --no-audit install

WORKDIR /home/zcloud/app

ENTRYPOINT ["/scripts/startup.sh"]
