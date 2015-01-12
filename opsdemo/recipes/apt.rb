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
