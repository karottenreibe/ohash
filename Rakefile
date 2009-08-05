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
end

