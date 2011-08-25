module ProfilesHelper
  def render_profile(profile)
    render "profiles/profile", :profile => profile if profile
  end
  
  def add_crm_link(field)
    link_to "+ #{t(".add_#{field}")}", "##{field}", :class => "add_nested_item add_crm_link", :rel => "#{field}"
  end
  
  def options_for_profile_type(types)
    types.to_enum(:each_with_index).collect do |type,i|
       [t("profiles.profile_types.#{type.downcase}", :default => type),i]
    end
  end
  
  def remove_link_unless_new_record(fields)
    ''.tap do |out|
      out << fields.hidden_field(:_destroy) unless fields.object.new_record?
      out << link_to("", "##{fields.object.class.name.underscore}", :class => 'remove_nested_item trash_icon')
    end.html_safe
  end
  

end