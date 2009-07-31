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


# vim: syntax=ruby
