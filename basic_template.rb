
run "echo FIXME > README"

git :init

file ".gitignore", <<-END
.DS_Store
log/*.log
tmp/**/*
config/database.yml
db/*.sqlite3
END

run "touch tmp/.gitignore log/.gitignore vendor/.gitignore"
run "cp config/database.yml config/example_database.yml"
run "rm public/index.html"

generate :controller, "welcome"
route "map.root :controller => 'welcome'"

git :add => "."
git :commit => "-m 'initial commit'"
