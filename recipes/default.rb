%w(make libc6 libpcre3 libpcre3-dev libpcrecpp0 libssl0.9.8 libssl-dev zlib1g zlib1g-dev lsb-base).each do |p|
  package p
end

remote_file "#{node[:nginx][:source_dir]}/nginx-#{node[:nginx][:version]}.tar.gz" do
  source node[:nginx][:remote_source]
  mode 00640
end

execute "Unpack tarball" do
  cwd node[:nginx][:source_dir]
  user node[:nginx][:user]
  command "tar -xzf nginx-#{node[:nginx][:version]}.tar.gz"
end

execute "Configure Nginx" do
  cwd "#{node[:nginx][:source_dir]}/nginx-#{node[:nginx][:version]}"
  user node[:nginx][:user]
  command "./configure #{node[:nginx][:build_config]}"
end

execute "Build & Install Nginx" do
  cwd "#{node[:nginx][:source_dir]}/nginx-#{node[:nginx][:version]}"
  user node[:nginx][:user]
  command "make && make install"
end

cookbook_file "/etc/init.d/nginx" do
  source "nginx-init"
  owner node[:nginx][:user]
  group node[:nginx][:group]
  mode 00755
end

<<<<<<< HEAD
#directory node[:nginx][:config_dir] do
#  owner node[:nginx][:user]
#  group node[:nginx][:group]
#  mode 00755
#  action :create
#  recursive true
#end

# Create config subdirectories
%w(sites-avaliable sites-enabled).each do |d|
  directory "#{node[:nginx][:config_dir]}/#{d}" do
    owner node[:nginx][:user]
    group node[:nginx][:group]
    mode 00755
    action :create
    recursive true
  end
end

=======
# Create config subdirectories
%w(sites-avaliable sites-enabled).each do |d|
  directory "#{node[:nginx][:config_dir]}/#{d}" do
    owner node[:nginx][:user]
    group node[:nginx][:group]
    mode 00755
    action :create
    recursive true
  end
end

>>>>>>> 34cd42fbe4b178a4e08193652da003f012268e79
cookbook_file "#{node[:nginx][:config_dir]}/nginx.conf" do
  source "nginx.conf"
  mode 00640
end

service 'nginx' do
   supports :status => true, :restart => true, :reload => true
<<<<<<< HEAD
   action [:enable, :restart]
=======
   action [:enable, :start]
>>>>>>> 34cd42fbe4b178a4e08193652da003f012268e79
end
