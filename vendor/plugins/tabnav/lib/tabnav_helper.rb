module TabnavHelper  
  protected 

  def tabnav(name, &block)
    html = capture { render "shared/#{name}" }
    if block_given?
      options = {:id => @_tabnav.html[:id] + '_content', :class => @_tabnav.html[:class] + '_content'}
      html << tag('div', options, true)
      html << capture(&block)
      html << '</div>' 
      out html
      nil # avoid duplication if called with <%= %>
    else
      html
    end
  end

  def render_tabnav(name, opts={}, &proc)
    raise ArgumentError, "Missing name parameter in tabnav call" unless name
    raise ArgumentError, "Missing block in tabnav call" unless block_given?
    @_tabnav = Tabnav::Nav.new(name, opts)
    @_binding = proc.binding

    instance_eval(&proc) 
    out tag('ul',@_tabnav.html ,true)
      render_tabnav_tabs 
    out "</ul>"
    nil
  end 

  def add_tab(options = {}, &block) 
    raise 'Cannot call add_tab outside of a render_tabnav block' unless @_tabnav
    @_tabnav.tabs << Tabnav::Tab.new(options, &block)
    nil
  end
  
  def controller_names
    files = Dir.entries(File.join(Rails.root, 'app/controllers'))
    controllers = files.select {|x| x.match '_controller.rb'}
    controllers.map {|x| x.sub '_controller.rb', ''}.sort
  end

  private

  def render_tabnav_tabs
    #out tag('ul', {} , true)

    @_tabnav.tabs.each do |tab|

      if tab.disabled?
        tab.html[:class] ||= ""
        tab.html[:class] += ' disabled'
      elsif tab.highlighted?(params)
        tab.html[:class] ||= ""
        tab.html[:class] += ' active'
      end

      #link_options = {} 
      
      #if tab.html[:id]
      #  li_options[:id] = tab.html[:id] + '_container'
      #end
      
      #if tab.html[:link_class]      
      #  link_options[:class] = tab.html[:link_class] 
      #end
      #tab.html.delete(:link_class)
        
      if tab.html[:ending]
        tag_end = tab.html[:ending]
      end
      tab.html.delete(:ending)

      #li_tab(tab,link_options,tag_end)
      li_tab(tab, tag_end)
    end 
    #out '</ul>'
  end  

  #def li_tab(tab,link_options,tag_end)
  def li_tab(tab, tag_end)
    out tag('li',  tab.html, true)
    
    out tab.before_link unless tab.no_before?

    if tab.disabled? || (tab.link.empty?)
      out content_tag('span', tab.name, tab.link_options) 
    elsif !tab.link.empty?
      out link_to(tab.name, tab.link, tab.link_options)
    else
      raise "Ground Control to Major Tom..."
    end 
    
    out tab.after_link unless tab.no_after?
    
    out "</li>"
    out "#{tag_end}"
  end

  def out(string)
    concat string.html_safe
  end
end