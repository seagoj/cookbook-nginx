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
  execute "tar -xzf nginx-1.4.2.tar.gz"
end

execute "Configure Nginx" do
  cwd "/usr/src/nginx-1.4.2"
  user "root"
  execute "--prefix=/usr --sbin-path=/usr/sbin --pid-path=/var/run/nginx.pid --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --user=www-data --group=www-data --with-http_ssl_module --with-http_spdy_module --with-ipv6"
end

execute "Build Nginx" do
  cwd "/usr/src/nginx-1.4.2"
  user "root"
  execute "make && make install"
end
  
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
