#!/usr/bin/zsh

#
# A systemd timer runs this script once a week to clean out older backups
# Another timer rclone remaining tarballs to Proton Drive 
# NOTE! nullglobe used in tar_files variable are zsh specific
# 
# jontas, at you service
#

backup_dir="$HOME/Public"
tar_files=($backup_dir/*.tar.{lzma,xz,gz,gzip}(N))

if (( $#tar_files > 3 )); then
    rm -f "${tar_files[@]:4}"
fi
