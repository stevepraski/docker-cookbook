#
# Cookbook:: docker-cookbook
# Recipe:: zfs_storage
#
# Copyright:: 2017, Steven Praski
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# ZFS support has been depreciated in RedHat's roadmap, so I'm only going to support Ubuntu
raise "Unsupported Platform Family: #{node['platform_family']}" unless node['platform_family'] == 'debian'

# ZFS on Debian uses dkms, which I'm not going to deal with
raise "Unsupported Platform: #{node['platform']}" unless node['platform'] == 'ubuntu'

apt_update

package node['platform_version'].to_f >= 17 ? 'zfsutils' : 'zfs'

execute 'create-zpool' do
  command 'zpool create -f -o ashift=' +
          node['docker-server']['zfs-ashift'].to_s +
          ' -m /var/lib/docker docker-zpool ' +
          node['docker-server']['storage-device']
  user 'root'
  group 'root'
  not_if 'zpool status | grep docker-zpool'
end
