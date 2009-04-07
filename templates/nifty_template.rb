gem 'nifty-generators', :lib => 'nifty_generators', :source => 'http://gems.github.com'

run "sudo rake gems:install"

if yes? <<-END
  
  +-------------------------------------------+
  |                                           |
  | Generate nifty layout? ( yes / no )       |
  |                                           |
  +-------------------------------------------+
END
  generate :nifty_layout
end

if yes? <<-END
  
  +-------------------------------------------+
  |                                           |
  | Generate nifty config? ( yes / no )       |
  |                                           |
  +-------------------------------------------+
END
  generate :nifty_config
  
  if yes? <<-END

    +--------------------------------------------+
    |                                            |
    | Prettify nifty config access? ( yes / no ) |
    |                                            |
    |   For example:                             |
    |                                            |
    |     AppConfig.domain                       |
    |                                            |
    |   Instead of the default:                  |
    |                                            |
    |     APP_CONFIG[:domain]                    |
    +--------------------------------------------+
END
    file "config/initializers/load_app_config.rb", <<-END
require 'ostruct'
require 'yaml'

config = OpenStruct.new(YAML.load(raw_config))
::AppConfig = OpenStruct.new(config.send(RAILS_ENV))
END
  end
end

if yes? <<-END
  
  +-------------------------------------------+
  |                                           |
  | Generate nifty_auth? ( yes / no )         |
  |                                           |
  +-------------------------------------------+
END
  generate :nifty_authentication
end


# file 'app/controllers/welcome_controller.rb', <<-CODE
# class WelcomeController < ApplicationController
#   
#   layout "application"
#   
#   def index
#   end
#   
# end
# CODE
# 
# file 'app/views/welcome/index.html.erb', <<-CODE
# <% title "Welcome!" %>
# <p>Hello and welcome!</p>
# CODE