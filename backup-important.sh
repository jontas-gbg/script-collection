#!/bin/bash

# A systemd timer runs this script every 6 hours.
# Backup the important stuff to both local and remote mounted file system.
# jontas@gmx.com in 2021, updated in 2024


backup_dir="$HOME/MY_BAK"
backup_file="backup-$(date +%Y-%m-%d-%H-%M).tar.gz"
end_dir="$HOME/Public"
remote_dir="$HOME/Onedrive/Arch_backup/Tarballs/"

# Ensure backup directory exists
mkdir -p "$backup_dir"

backup_directories=(
  "$HOME/.local/bin"
  "$HOME/.config/systemd"
  "$HOME/Documents/zim"
  "$HOME/Documents/AF"
  "$HOME/Documents/Script"
  "$HOME/.config/conky"
  # continue here if needed
)

create_tarball() {
  cd "${temp_dir}" || exit 1
  tar czf "${backup_dir}/${backup_file}" -- *
}

clean_up_temps() {
  cd ~ || exit 1
  rm -fr "${temp_dir}" "${backup_dir}"
}

copy_to_remote() {
  cd "${end_dir}" || exit 1
  cp "${backup_file}" "${remote_dir}"
}
# Create temporary directory
temp_dir=$(mktemp -d)

# Copy dirs to temp using rsync for efficiency
for dir in "${backup_directories[@]}"; do
  if [ -d "${dir}" ]; then
    cp -a "${dir}/" "${temp_dir}"
  fi
done

# Create compressed tar ball
create_tarball

# Move tar ball to ~/Public
mv "${backup_dir}/${backup_file}" "${end_dir}/"

# Copy to mounted remote fs
copy_to_remote

# Clean temps
clean_up_temps
