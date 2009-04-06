load_template "http://github.com/polly/rails_templates/raw/master/templates/base_template.rb"

if yes? <<-END
  
  +-------------------------------------------+
  |                                           |
  | Setup Will Paginate? ( yes / no )         |
  |                                           |
  +-------------------------------------------+
END
  load_template "http://github.com/polly/rails_templates/raw/master/templates/will_paginate_template.rb"
end

if yes? <<-END
  
  +-------------------------------------------+
  |                                           |
  | Setup Hoptoad? ( yes / no )               |
  |                                           |
  +-------------------------------------------+
END
  load_template "http://github.com/polly/rails_templates/raw/master/templates/hoptoad_template.rb"
end

if yes? <<-END
  
  +-------------------------------------------+
  |                                           |
  | Niftify? ( yes / no )                     |
  |                                           |
  +-------------------------------------------+
END
  load_template "http://github.com/polly/rails_templates/raw/master/templates/nifty_template.rb"
end

if yes? <<-END
  
  +-------------------------------------------+
  |                                           |
  | Setup cucumber and shoulda? ( yes / no )  |
  |                                           |
  +-------------------------------------------+
END
  load_template "http://github.com/polly/rails_templates/raw/master/templates/test_template.rb"
end

if yes? <<-END
  
  +-------------------------------------------+
  |                                           |
  | Generate LabeledFormBuilder? ( yes / no ) |
  |                                           |
  +-------------------------------------------+
END
  load_template "http://github.com/polly/rails_templates/raw/master/templates/form_builder_template.rb"
end