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
