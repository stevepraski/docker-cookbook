# Docker Server
default['container-storage-setup']['version'] = 'v0.6.0' # Project Atomic storage setup script
default['docker-server']['storage-device'] = '/dev/sdb' # WARNING: change to an empty device
default['docker-server']['storage-size'] = '2048MB' # adjust this amount to account for LVM overhead (lvcreate size conventions)
default['docker-server']['zfs-ashift'] = 12 # lying 4K drive support (i.e., all modern drives)
default['docker-server']['storage-driver'] = 'lvm' # 'zfs' otherwise lvm/xfs (zfs is only supported for Ubuntu)

# Miscellaneous Services
default['docker-server']['streamlist']['listen_port'] = 8888
default['docker-server']['streamlist']['password'] = 'secret'
