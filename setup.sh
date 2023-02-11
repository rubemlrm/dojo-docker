#!/bin/bash

docker volume create dojo_portainer_data
docker volume create dojo_pihole_data
docker volume create dojo_pihole_dns_data
docker volume create dojo_homeassistant_data
docker volume create dojo_homeassistant_database
docker volume create dojo_influxdb_data
docker volume create dojo_prometheus_data
docker volume create dojo_grafana_data
docker volume create dojo_freshrss_data
