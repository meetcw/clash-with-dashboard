FROM node:lts

WORKDIR /ui

RUN git clone https://github.com/Dreamacro/clash-dashboard.git \
    && cd clash-dashboard \
    && npm install --force \
    && npm run build \
    && cp -R dist/* /ui \
    && cd /ui && rm -rf clash-dashboard

FROM dreamacro/clash

ENV SECRET="secret"
ENV CONTROLLER_PORT="9090"
ENV SUBSCRIPTION=""

COPY --from=0 /ui /ui
COPY ./start.sh /start.sh

ENTRYPOINT ["/start.sh"]