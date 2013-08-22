%w(libc6 libpcre3 libpcre3-dev libpcrecpp0 libssl0.9.8 libssl-dev zlib1g zlib1g-dev lsb-base).each do |p|
  package p
end

remote_file "/usr/src/nginx-1.4.2.tar.gz" do
  source "http://nginx.org/download/nginx-1.4.2.tar.gz"
  mode "0777"
end

execute "Unpack tarball" do
  cwd "/usr/src/"
  user "root"
  command "tar -xzf nginx-1.4.2.tar.gz"
end

execute "Configure Nginx" do
  cwd "/usr/src/nginx-1.4.2"
  user "root"
  command "./configure --prefix=/usr --sbin-path=/usr/sbin --pid-path=/var/run/nginx.pid --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --user=www-data --group=www-data --with-http_ssl_module --with-http_spdy_module --with-ipv6"
end

execute "Build & Install Nginx" do
  cwd "/usr/src/nginx-1.4.2"
  user "root"
  command "make && make install"
end

cookbook_file "/etc/init.d/nginx" do
  source "nginx-init"
  mode "0755"
end

execute "Enable Nginx Service" do
  user "root"
  command "update-rc.d nginx defaults"
end

execute "Create log and config directories" do
  user "root"
  command "mkdir /var/log/nginx && mkdir /etc/nginx/sites-available && mkdir /etc/nginx/sites=enabled"
end
  
# service 'nginx' do
#  supports :status => true, :restart => true, :reload => true
#  action :enable
# end
  
cookbook_file '/etc/nginx/nginx.conf' do
  source "nginx.conf"
  mode "0777"
end

execute "Copy sites-available" do
  user "root"
  command "cp /vagrant/cookbooks/nginx/files/default/sites-available/* /etc/nginx/sites-available"
end
  
# service 'nginx' do
#   supports :status => true, :restart => true, :reload => true
#   action :start
# end

execute "Start NGinx service" do
  user "root"
  command "service nginx start"
end
