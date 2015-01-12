include_recipe 'nodejs::nodejs_from_binary'
include_recipe 'nodejs::npm'

nodejs_npm 'bower' do
  version '1.3.12'
end

