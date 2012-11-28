package 'git'
lib = '/vagrant/lib'

unless(File.exists?(lib))
	Dir.mkdir(lib)
end

execute 'git-bootstrap' do
	unless(File.exists?("#{lib}/bootstrap"))
	command "git clone git://github.com/twitter/bootstrap.git #{lib}/bootstrap"
end

