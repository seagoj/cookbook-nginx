package 'git'
lib = '/vagrant/lib'

unless(File.exists?(lib))
	Dir.mkdir(lib)
end

unless(File.exists?("#{lib}/bootstrap"))
	execute 'git-bootstrap' do
		command "git clone git://github.com/twitter/bootstrap.git #{lib}/bootstrap"
	end
end
