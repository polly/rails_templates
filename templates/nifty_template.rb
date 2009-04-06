gem 'nifty-generators', :lib => 'nifty_generators', :source => 'http://gems.github.com'

run "sudo rake gems:install"

if yes?("Generate nifty layout?")
  generate :nifty_layout
end

if yes?("Generate nifty config?")
  generate :nifty_config
end

if yes?("Generate nifty authentication?")
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