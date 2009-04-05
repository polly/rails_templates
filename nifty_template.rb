#gem "nifty-generators"

generate :nifty_layout
generate :nifty_config

file 'app/controllers/welcome_controller.rb', <<-CODE
class WelcomeController < ApplicationController
  
  layout "application"
  
  def index
  end
  
end
CODE

file 'app/views/welcome/index.html.erb', <<-CODE
<% title "Welcome!" %>
<p>Hello and welcome!</p>
CODE

git :add => "."
git :commit => "-m 'niftyfied project with nifty_template'"
