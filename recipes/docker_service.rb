#
# Cookbook:: docker-cookbook
# Recipe:: docker_service
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

docker_service 'default' do
  storage_driver 'devicemapper'
  storage_opts [ # ideally, should be read from /etc/sysconfig/docker-storage directly,...
    'dm.fs=xfs',
    'dm.thinpooldev=/dev/mapper/docker--vg-docker--pool',
    'dm.use_deferred_deletion=true',
    'dm.use_deferred_removal=true'
  ]
  action [:create, :start]
end
