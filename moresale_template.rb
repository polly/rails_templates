# base_template.rb

run "echo TODO > README"

# Setup and install any gems we want to use

if yes?("Setup will_paginate?")
  gem 'mislav-will_paginate', :lib => 'will_paginate', :source => 'http://gems.github.com'
end

if yes?("Setup haml?")
  gem 'haml', :lib => 'haml'
  
  # This saves us from having to run the haml --rails command
  file 'vendor/plugins/haml/init.rb', <<-END
require 'rubygems'
begin
  require File.join(File.dirname(__FILE__), 'lib', 'haml') # From here
rescue LoadError
  require 'haml' # From gem
end

# Load Haml and Sass
Haml.init_rails(binding)
END
end

rake "gems:unpack"


# Setup and use any plugins we want to use

if yes?("Would you like to use the Hoptoad notifier plugin?")
  plugin 'hoptoad_notifier', :git => 'git://github.com/thoughtbot/hoptoad_notifier.git'  
  hoptoad_api_key = ask('What is your Hoptoad API key?')

  gsub_file 'app/controllers/application_controller.rb', /(class ApplicationController.*)/, "\\1\n  include HoptoadNotifier::Catcher"
  
  initializer 'hoptoad.rb', <<-END
HoptoadNotifier.configure do |config|
  config.api_key = '#{hoptoad_api_key}'
end
END
end

if yes?("Niftify?")
  load_template "http://github.com/polly/rails_templates/raw/master/nifty_template.rb"
end

if yes?("Setup cucumber and shoulda?")
  load_template "http://github.com/polly/rails_templates/raw/master/test_template.rb"
end

# Edit files generated by rails

gsub_file 'app/controllers/application_controller.rb', /#\s*(filter_parameter_logging :password)/, '\1'


# Delete some files generated by rails

run "rm public/index.html"
run "rm public/favicon.ico"
run "rm public/robots.txt"


# Git specific setup
 
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

git :add => ".", :commit => "-m 'initial commit'"
