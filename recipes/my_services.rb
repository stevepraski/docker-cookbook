#
# Cookbook:: docker-cookbook
# Recipe:: my_services
#
# Copyright:: 2017, 2017, Steven Praski
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

# Miscellaneous Services
#  Steamlist: https://github.com/streamlist/streamlist

docker_image 'streamlist' do
  repo 'streamlist/streamlist'
  tag 'latest'
  action :pull
end

docker_image 'alpine' do
  repo 'alpine'
  tag 'latest'
  action :pull
end

docker_volume 'streamlist-data' do
  action :create
end

docker_container 'streamlist-data-setup' do
  repo 'alpine'
  volumes 'streamlist-data:/data'
  command '/bin/sh -c "echo ' + node['docker-server']['streamlist']['password'] + ' > /data/.authsecret"'
  action :run_if_missing
end

docker_container 'streamlist' do
  repo 'streamlist/streamlist'
  port node['docker-server']['streamlist']['listen_port'].to_s + ':8080'
  volumes 'streamlist-data:/data'
  command '--http-host localhost --http-username admin --http-addr :8080'
end
