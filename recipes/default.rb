package 'nginx'
  
service 'nginx' do
  supports :status => true, :restart => true, :reload => true
  action :enable
end
  
cookbook_file '/etc/nginx/nginx.conf' do
  source "nginx.conf"
  mode "0777"
end
  
service 'nginx' do
  supports :status => true, :restart => true, :reload => true
  action :start
end
