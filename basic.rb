# remove prototype
FileUtils.rm 'public/javascripts/controls.js'
FileUtils.rm 'public/javascripts/dragdrop.js'
FileUtils.rm 'public/javascripts/effects.js'
FileUtils.rm 'public/javascripts/prototype.js'
 
# remove static stuff
FileUtils.rm 'public/index.html'
FileUtils.rm 'public/images/rails.png'

# Testing
plugin "rspec", :git => "git://github.com/dchelimsky/rspec.git"  
plugin "rspec-rails", :git => "git://github.com/dchelimsky/rspec-rails.git"  
generate :rspec
generate :cucumber

# git
git :init

run "echo 'TODO add readme content' > README"
run "cp config/database.yml config/example_database.yml"
run "touch tmp/.gitignore log/.gitignore vendor/.gitignore"
 
file ".gitignore", <<-END
log/*.log
tmp/**/*
config/database.yml
db/*.sqlite3
END

# migrate so rake will run out of the box
rake "db:migrate"

git :add => '.'
git :commit => '-m "Initial commit"'

