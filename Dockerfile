FROM alpine:3.7

ENV LANG C.UTF-8

ENV MQTTIP=192.168.1.100
ENV MQTTPORT=1883
ENV MQTTUSER=""
ENV MQTTPASS=""
ENV SCREENLOGICIP=192.168.1.200

RUN apk add bash
RUN apk update
RUN apk add --update nodejs nodejs-npm
RUN apk add jq mosquitto-clients && npm install node-screenlogic smart-buffer

COPY run.sh /
COPY set_circuit /node_modules/node-screenlogic/
COPY set_salt /node_modules/node-screenlogic/
COPY set_temp /node_modules/node-screenlogic/
COPY set_heater /node_modules/node-screenlogic/
COPY set_light /node_modules/node-screenlogic/
COPY send_state_to_ha.js /node_modules/node-screenlogic/
COPY initialize.js /node_modules/node-screenlogic/

RUN chmod a+x /node_modules/node-screenlogic/*
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]