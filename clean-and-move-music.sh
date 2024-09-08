#!/bin/bash

# Remove all crap, keep the music. sort of.
# jontas@gmx.com in 2020

source_dir="./"
target_dir="$HOME/Public/yt-downloads"

# Process files and directories in the source directory
process_source_dir() {
    for file in "$1"/*; do
        if [ -f "${file}" ]; then
            case "${file}" in
                *.mp3 | *.flac | *.opus | *.m4a | *.wav)
                    # Move audio files to the target directory
                    mv "${file}" "${target_dir}"
                    ;;
                *.jpg)
                    # Check the size of JPEG files and remove small ones
                    if [ "$(stat -c%s ${"file"})" -le 20480 ]; then
                        rm "${file}"
                    fi
                    ;;
                *)
                    # Remove other files
                    rm "${file}"
                    ;;
            esac
        elif [ -d "${file}" ]; then
            # Recursively process subdirectories
            process_source_dir "${file}"
        fi
    done
}

# Process the source directory
process_source_dir "${source_dir}"
