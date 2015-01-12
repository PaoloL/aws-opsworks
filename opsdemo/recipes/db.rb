include_recipe 'mysql::server'
include_recipe 'mysql::client'
include_recipe 'database::mysql'

execute 'restart mysql' do
  command 'service mysql stop; service mysql start'
end

include_recipe 'database::mysql'

connection_info = {:host => 'localhost',
                   :username => 'root',
                   :password => node['mysql']['server_root_password']}

mysql_database 'posso' do
  connection connection_info
  action :create
end

mysql_database_user 'posso' do
  connection connection_info
  database_name 'posso'
  password 'posso'
  privileges [:all]
  action :grant
end
