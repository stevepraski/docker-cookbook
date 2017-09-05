# Docker Server
default['container-storage-setup']['version'] = 'v0.6.0' # Project Atomic storage setup script
default['docker-server']['storage-device'] = '/dev/sdb' # WARNING: change to an empty device
default['docker-server']['storage-size'] = '2048MB' # adjust this amount to account for LVM overhead (lvcreate size conventions)

# Miscellaneous Services
default['docker-server']['streamlist']['listen_port'] = 8888
default['docker-server']['streamlist']['password'] = 'secret'
