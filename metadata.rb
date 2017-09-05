name 'docker-cookbook'
maintainer 'Steven Praski'
maintainer_email 'stevepraski@users.noreply.github.com'
source_url 'https://github.com/stevepraski/docker-cookbook'
issues_url 'https://github.com/stevepraski/docker-cookbook/issues'
license 'Apache-2.0'
description 'Installs/Configures docker-cookbook'
long_description 'Installs/Configures docker-cookbook'
supports 'centos', '= 7.3'
chef_version '>= 13.2.20' if respond_to?(:chef_version)
version '0.1.0'

depends 'docker', '~> 2.15'
