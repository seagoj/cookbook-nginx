  package 'nginx'
  
  service 'nginx' do
    supports :status => true, :restart => true, :reload => true
    action :enable
  end
  
  cookbook_file '/etc/nginx/sites-available/default' do
    source "config/nginx.conf"
    mode "0777"
  end
  
service 'nginx' do
  supports :status => true, :restart => true, :reload => true
  action :start
end
