#!/bin/bash

tar -zcvf /home/rubemlrm/docker/data/docker-backups/volumes/$(date +%s).tar.gz \
 --exclude="**/cache/**" \
 --exclude="/home/rubemlrm/docker/data/volumes/media/config/transcodes/**" \
 --exclude="/home/rubemlrm/docker/data/volumes/media/rutorrent/**" \
 --exclude="/home/rubemlrm/docker/data/volumes/torrents/**" \
 --exclude="/home/rubemlrm/docker/data/volumes/kavita/covers" \
 --exclude="/home/rubemlrm/docker/data/volumes/media/config/metadata/**" \
 /home/rubemlrm/docker/data/volumes

chown -R rubemlrm:rubemlrm /home/rubemlrm/docker/data/docker-backups/
