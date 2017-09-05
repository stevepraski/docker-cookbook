# docker-cookbook

## Simple Docker host, with XFS/LVM or ZFS backend storage

## Work In Progress

## WARNING: By default this cookbook will destroy any data on /dev/sdb !

### ZFS
 - this cookbook only supports ZFS in Ubuntu (tested on 17.04)
 - ZFS is not necessarily recommended for production: "...it is not recommended to use the zfs Docker storage driver for production use unless you have substantial experience with ZFS on Linux." (https://docs.docker.com/engine/userguide/storagedriver/zfs-driver/)
 - ZFS support in various Linux distributions (e.g., RedHat) is somewhat problematic because of ZFS licensing

### Good Examples of:
 - Embedding a Vagrantfile for Test Kitchen which adds a file-backed storage device to the VM
 - LVM provisioning for Docker (thanks to Project Atomic)
 - Populating a Docker volume before use
