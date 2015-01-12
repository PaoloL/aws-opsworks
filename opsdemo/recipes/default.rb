include_recipe 'apt'

apt_repository 'brightbox-ruby-ng' do
  action       :add
  uri          'http://ppa.launchpad.net/brightbox/ruby-ng/ubuntu'
  distribution node['lsb']['codename']
  components   ['main']
  keyserver    'keyserver.ubuntu.com'
  key          'C3173AA6'
end

apt_package 'build-essential'
apt_package 'git'

gem_package 'thin' do
  version '1.6.3'
  gem_binary '/usr/bin/gem'
end

execute 'install thin' do
  command 'thin install'
end

template '/etc/thin/posso.yml' do
  source 'posso.yml.erb'
  mode '00644'
end

service 'thin' do
  action [ :enable, :start ]
end

include_recipe 'nodejs::nodejs_from_binary'
include_recipe 'nodejs::npm'

nodejs_npm 'bower' do
  version '1.3.12'
end

include_recipe 'nginx'

template '/etc/nginx/sites-available/posso.com' do
  source 'posso.com.erb'
  mode '00644'
end

link '/etc/nginx/sites-enabled/posso.com' do
  to '/etc/nginx/sites-available/posso.com'
end
