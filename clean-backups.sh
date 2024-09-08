#!/bin/bash

# Runs from a systemd timer once a week cleaning up backup files
# A sed command make sure to always save the last 3 backups in both 
# local and remote dirs.
# jontas@gmx.com in 2024

LOCAL_BACKUP_DIR="$HOME/Public"
REMOTE_BACKUP_DIR="$HOME/OneDrive/Arch_backup/Tarballs"

delete_old_backups() {
  local dir="$1"

  # shellcheck disable=SC2016
  find "${dir}" -name 'backup-*.tar.{lzma,xz,gz}' -type f -printf '%T@ %p\n' |
    sort -r |
    sed -n '4,${p}' |
    awk '{print $2}' |
    xargs -t rm -f
}

# Delete old backups in the local directory
delete_old_backups "${LOCAL_BACKUP_DIR}"

# Delete old backups in the remote directory
delete_old_backups "${REMOTE_BACKUP_DIR}"
