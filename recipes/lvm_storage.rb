#
# Cookbook:: docker-cookbook
# Recipe:: lvm_storage
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

package 'lvm2'
package 'git'

# container-storage-setup used to be docker-storage-setup, and as far as I know
# the documentation as of 2017-09-02 is still wrong, but legacy mode still works
git 'checkout-container-storage-setup' do
  destination ::File.join('/opt/container-storage-setup')
  repository 'https://github.com/projectatomic/container-storage-setup.git'
  revision node['container-storage-setup']['version']
  action :checkout
end

# as noted, we are using legacy mode, hence the apparent naming mismatch
template 'runtime-storage-setup' do
  path '/etc/sysconfig/docker-storage-setup'
  source 'runtime-storage-setup.erb'
  owner 'root'
  group 'root'
  mode '0540'
  variables(
    storage_device: node['docker-server']['storage-device'],
    storage_size: node['docker-server']['storage-size']
  )
end

execute 'container-storage-setup' do
  cwd '/opt/container-storage-setup'
  command 'sh container-storage-setup.sh'
  not_if { ::File.exist?('/etc/sysconfig/docker-storage') }
end
