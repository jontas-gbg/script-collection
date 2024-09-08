#!/bin/bash

latest_backup=$(ls -t /home/jontas/Public/backup-conf-*.tar.lzma | head -1)
cp "$latest_backup" /home/jontas/pCloudDrive/Backup-archserver/

# Behåll de två senaste tarballs och radera resten
ls -t ~/Public/backup-conf-*.tar.lzma | tail -n +3 | xargs rm -f
