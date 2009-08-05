require 'jeweler'

task :release do
    sh "vim HISTORY.markdown"
    sh "vim README.markdown"
    sh "git commit -a -m 'prerelease adjustments'; true"
end

Jeweler::Tasks.new do |gem|
    gem.name = "ohash"
    gem.summary = gem.description = "A simple, enhanced hash structure with the direct member access of OpenStruct, but without all the restrictions."
    gem.email = "karottenreibe@gmail.com"
    gem.homepage = "http://github.com/karottenreibe/vim-syntax"
    gem.authors = ["Fabian Streitel"]
    gem.rubyforge_project = 'ohash'
end

begin
  require 'rake/contrib/sshpublisher'
  namespace :rubyforge do

    desc "Release gem and RDoc documentation to RubyForge"
    task :release => ["rubyforge:release:gem", "rubyforge:release:docs"]

    namespace :release do
      desc "Publish RDoc to RubyForge."
      task :docs => [:rdoc] do
        config = YAML.load(
            File.read(File.expand_path('~/.rubyforge/user-config.yml'))
        )

        host = "#{config['username']}@rubyforge.org"
        remote_dir = "/var/www/gforge-projects/the-perfect-gem/"
        local_dir = 'rdoc'

        Rake::SshDirPublisher.new(host, remote_dir, local_dir).upload
      end
    end
  end
rescue LoadError
  puts "Rake SshDirPublisher is unavailable or your rubyforge environment is not configured."
end

