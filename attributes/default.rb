default[:nginx][:user]          = "root"
default[:nginx][:group]         = "root"
default[:nginx][:source_dir]    = "/usr/src"
default[:nginx][:version]       = "1.4.2"
default[:nginx][:remote_source] = "http://nginx.org/download/nginx-#{default[:nginx][:version]}.tar.gz"
default[:nginx][:config_dir]    = "/etc/nginx"
<<<<<<< HEAD
default[:nginx][:build_config]  = "--prefix=/usr --sbin-path=/usr/sbin --pid-path=/var/run/nginx.pid --conf-path=#{default[:nginx][:config_dir]}nginx.conf --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --user=www-data --group=www-data --with-http_ssl_module --with-http_spdy_module --with-ipv6"
=======
default[:nginx][:build_config]  = "--prefix=/usr --sbin-path=/usr/sbin --pid-path=/var/run/nginx.pid --conf-path=#{default[:nginx][:config_dir]}/nginx.conf --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --user=www-data --group=www-data --with-http_ssl_module --with-http_spdy_module --with-ipv6"
>>>>>>> 34cd42fbe4b178a4e08193652da003f012268e79
