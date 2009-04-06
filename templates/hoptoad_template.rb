plugin 'hoptoad_notifier', :git => 'git://github.com/thoughtbot/hoptoad_notifier.git'  
hoptoad_api_key = ask <<-END
  
  +-------------------------------------------+
  |                                           |
  | What's your hoptoad api key?              |
  |                                           |
  +-------------------------------------------+
END

gsub_file 'app/controllers/application_controller.rb', /(class ApplicationController.*)/, "\\1\n  include HoptoadNotifier::Catcher"

initializer 'hoptoad.rb', <<-END
HoptoadNotifier.configure do |config|
  config.api_key = '#{hoptoad_api_key}'
end
END