#!/bin/sh
if test -z ${SUBSCRIPTION}
then
echo "Use default config."
/clash -ext-ui /ui -ext-ctl 0.0.0.0:${CONTROLLER_PORT} -secret ${SECRET}
else
echo "Downloading config from: ${SUBSCRIPTION}"
wget "${SUBSCRIPTION}" -O config.yaml &&/clash -ext-ui /ui -f /config.yaml -ext-ctl 0.0.0.0:${CONTROLLER_PORT} -secret ${SECRET}
fi
