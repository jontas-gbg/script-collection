#!/bin/bash

# Ange sökvägen till mappen
MAPP_PATH=~/Downloads/Backup-EOS

# Ange datumformatet
DATUM=$(date +%Y-%m-%d)

# Ange namnet på tar-filen med datumstämpel
TAR_FIL=zim-backup_$DATUM.tar

# SNABBASTE ALTERNATIVET
# Skapa tar-bollen och komprimera med xz
# tar -cvf $TAR_FIL -C $(dirname $MAPP_PATH) $(basename $MAPP_PATH)
# xz -z $TAR_FIL

BÄST KOMPRIMERAT
# Alternativt, komprimera med lzma
# tar -cvf $TAR_FIL -C $(dirname $MAPP_PATH) $(basename $MAPP_PATH)
# lzma $TAR_FIL
