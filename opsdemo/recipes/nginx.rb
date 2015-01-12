template '/etc/nginx/sites-available/posso.com' do
  source 'posso.com.erb'
  mode '00644'
end

link '/etc/nginx/sites-enabled/posso.com' do
  to '/etc/nginx/sites-available/posso.com'
end
