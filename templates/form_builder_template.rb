file "app/form_builders/labeled_form_builder.rb", <<-END
class LabeledFormBuilder < ActionView::Helpers::FormBuilder
  %w[text_field text_area collection_select file_field].each do |method_name|
    define_method(method_name) do |field_name, *args|
      @template.content_tag(:p, field_label(field_name, *args) + "<br />" + super)
    end
  end
  
  def select(field_name, *args)
    @template.content_tag(:p, field_label(field_name, *args) + "<br />" + super)
  end

  def check_box(field_name, *args)
    @template.content_tag(:p, super + " " + field_label(field_name, *args))
  end

  def multiple_check_boxes(name, subobjects, id_method, name_method, options = {})
    @template.content_tag(:p) do
      field_name = "\#{object_name}[\#{name}][]"
      subobjects.map do |subobject|
        @template.check_box_tag(field_name, subobject.send(id_method), object.send(name).include?(subobject.send(id_method))) + " " + subobject.send(name_method)
      end.join("<br />") + @template.hidden_field_tag(field_name, "")
    end
  end

  def submit(*args)
    @template.content_tag(:p, super)
  end


  private
  
  def field_label(field_name, *args)
    options = args.extract_options!
    label(field_name, options[:label])
  end
  
  def objectify_options(options)
    super.except(:label)
  end
end
END

gsub_file "app/helpers/application_helper.rb", /(module ApplicationHelper.*)/, <<-END
\\1\n
  def labeled_form_for(*args, &block)
    options = args.extract_options!.merge(:builder => LabeledFormBuilder)
    form_for(*(args + [options]), &block)
  end
END

gsub_file "config/environment.rb", /# Add additional load paths for your own custom dirs/, 'config.load_paths += %W( \#{RAILS_ROOT}/app/form_builders )'

puts "+-----------------------------------------------------------------------------+"
puts "| Usage:                                                                      |"
puts "|                                                                             |"
puts "|   <% form_for @user do |f| %>                                               |"
puts "|     <%= f.error_messages %>                                                 |"
puts "|     <p>                                                                     |"
puts "|       <%= f.label :username %><br />                                        |"
puts "|       <%= f.text_field :username %>                                         |"
puts "|     </p>                                                                    |"
puts "|     <p>                                                                     |"
puts "|       <%= f.label :password %><br />                                        |"
puts "|       <%= f.password_field :password %>                                     |"
puts "|     </p>                                                                    |"
puts "|     <p>                                                                     |"
puts "|       <%= f.label :password_confirmation, 'Confirm Password' %><br />       |"
puts "|       <%= f.password_field :password_confirmation %>                        |"
puts "|     </p>                                                                    |"
puts "|     <p><%= f.submit 'Sign up' %></p>                                        |"
puts "|   <% end %>                                                                 |"
puts "|                                                                             |"
puts "|   Becomes:                                                                  |"
puts "|                                                                             |"
puts "|   <% labeled_form_for @user do |f| %>                                       |"
puts "|     <%= f.error_messages %>                                                 |"
puts "|                                                                             |"
puts "|     <%= f.text_field :username, :label => 'Username:' %>                    |"
puts "|     <%= f.password_field :password, :label => 'Password:' %>                |"
puts "|     <%= f.password_field :password_confirmation, :label => 'Password:' %>   |"
puts "|                                                                             |"
puts "|   	<%= f.submit 'Sign up' %>                                               |"
puts "|   <% end %>                                                                 |"
puts "+-----------------------------------------------------------------------------+"


<% form_for @user do |f| %>
  <%= f.error_messages %>
  <p>
    <%= f.label :username %><br />
    <%= f.text_field :username %>
  </p>
  <p>
    <%= f.label :email, "Email Address" %><br />
    <%= f.text_field :email %>
  </p>
  <p>
    <%= f.label :password %><br />
    <%= f.password_field :password %>
  </p>
  <p>
    <%= f.label :password_confirmation, "Confirm Password" %><br />
    <%= f.password_field :password_confirmation %>
  </p>
  <p><%= f.submit "Sign up" %></p>
<% end %>
