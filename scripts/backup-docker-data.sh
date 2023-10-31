w#!/bin/bash

tar -zcvf /home/rubemlrm/docker/data/docker-backups/volumes/$(date +%s).tar.gz \
 --exclude="**/cache/**" \
 /home/rubemlrm/docker/data/volumes

chown -R rubemlrm:rubemlrm /home/rubemlrm/docker/data/docker-backups/
