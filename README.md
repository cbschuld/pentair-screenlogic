# Docker Hub image for cbschuld/pentair-screenlogic

## An MQTT decorator for the Pentair Screenlogic system

Provides a Docker container to access the [Pentair Screenlogic](https://www.pentair.com/en/products/pool-spa-equipment/pool-automation/screenlogic2_interfaceforintellitouchandeasytouchautomationsystems.html) system via MQTT.

## Requirements

This container requires access to an MQTT broker.  You can run one easily in Docker or on a [Synology (inside docker)](https://chrisschuld.com/2020/08/installing-mqtt-broker-on-synology/);

This container requires the Pentair Screenlogic system and knowledge of what IP address your Screenlogic LAN adapter.

## Environment Variables

The container is expecting the following environment variables:

    SCREENLOGICIP = the IP address of your Screenlogic LAN adapter
    MQTTIP = IP address of your MQTT broker
    MQTTPORT = the port number of your MQTT broker (typically 1883) [*optional*]
    MQTTUSER = the username for your MQTT broker system [*optional*]
    MQTTPASS = the user's password for your MQTT broker system [*optional*]

## Example Usage

```shell
docker run --name pentair -e "MQTTIP=192.168.1.50" -e "SCREENLOGICIP=192.168.1.51" cbschuld/pentair-screenlogic:
```

## Special Thanks!

This container's work is hugely influenced by [Brian Woodworth's](https://github.com/bwoodworth) work via [https://github.com/bwoodworth/hassio-addons](https://github.com/bwoodworth/hassio-addons).  Brian's addon is designed for HomeAssistant's HASSIO.  If you are not using HASSIO and/or need an MQTT decorator for Pentair via Docker this solution removes the dependencies on HASSIO and is a vanilla MQTT decorator for the Pentair system ([context](https://github.com/bwoodworth/hassio-addons/issues/15)).

The guts of this decorator is provided by the great work of [Chris Pickett's](https://www.parnic.com/) [node-screenlogic](https://github.com/parnic/node-screenlogic).

A huge thanks to these folks for simplifying the automation of the Pentair system.





### Internal Notes

build and push
```shell
docker build --tag cbschuld/pentair-screenlogic:latest .
docker build --tag cbschuld/pentair-screenlogic:1.1 .
docker push cbschuld/pentair-screenlogic
```

local testing
```shell
docker run --name=pentair -e "MQTTIP=10.10.1.50" -e "SCREENLOGICIP=10.10.1.81" cbschuld/pentair-screenlogic:latest
```
