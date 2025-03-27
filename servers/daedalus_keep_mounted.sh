#!/usr/bin/env bash

mnt_ids=( airsonic )

# Check if the mount points are still mounted
# If not, remount them
for mnt_id in "${mnt_ids[@]}"; do
    # Make sure the destination directories exist
    mnt_src=daedalus:/mnt/storage/data/$mnt_id
    mnt_dst=/mnt/storage/$mnt_id
    [ ! -d "$mnt_dst" ] && mkdir -p "$mnt_dst"

    if ! mountpoint -q "$mnt_dst"; then
        sshfs "$mnt_src" "$mnt_dst"
    fi
done
