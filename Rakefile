# -*- ruby -*-

require 'rubygems'
require 'hoe'

Hoe.spec 'ohash' do |s|
    s.version = '0.0.1'
    s.developer('Fabian Streitel', 'karottenreibe@gmail.com')
end

task :manifest do
    sh 'rake check_manifest | grep -v "(in " | patch'
    sh 'vim Manifest.txt'
end

task :deploy do
    sh "vim History.txt"
    sh "vim README.txt"
    sh "vim ohash.gemspec"

    print "Enter the new version number >> "
    version = $stdin.gets.strip

    unless version =~ %r{[0-9]+\.[0-9]+\.[0-9]+}
        puts "Aborting: Invalid version number given."
        exit -1
    end
    
    puts "Committing"
    sh "git commit -a -m 'Releasing v#{version}'"
    puts "Tagging"
    sh "git tag #{version}"
    puts "Pushing"
    sh "git push"
    puts "Pushing tags"
    sh "git push --tags"

    puts "Done!"
end

# vim: syntax=ruby
