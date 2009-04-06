load_template "http://github.com/polly/rails_templates/raw/master/templates/base_template.rb"

if yes?("Setup will paginate? (yes/no)")
  load_template "http://github.com/polly/rails_templates/raw/master/templates/will_paginate_template.rb"
end

if yes?("Setup Hoptoad? (yes/no)")
  load_template "http://github.com/polly/rails_templates/raw/master/templates/hoptoad_template.rb"
end

if yes?("Niftify? (yes/no)")
  load_template "http://github.com/polly/rails_templates/raw/master/templates/nifty_template.rb"
end

if yes?("Setup cucumber and shoulda? (yes/no)")
  load_template "http://github.com/polly/rails_templates/raw/master/templates/test_template.rb"
end

if yes?("Setup our FormBuilder? (yes/no)")
  load_template "http://github.com/polly/rails_templates/raw/master/templates/form_builder_template.rb"
end
