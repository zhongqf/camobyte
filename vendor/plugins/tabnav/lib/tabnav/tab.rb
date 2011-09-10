module Tabnav
  class Tab
    include Highlightable
    include Disableable
    attr_accessor :link, :name, :html, :link_options, :before_link, :after_link

    def initialize(opts={})
      @name = opts[:name] 
      @link = opts[:link] || {}
      @link_options = opts[:link_options] || {}
      @before_link = opts[:before_link] || {}
      @after_link = opts[:after_link] || {}
      
      # wrap highlights into an array if only one hash has been passed
      opts[:highlights] = [opts[:highlights]] if opts[:highlights].kind_of?(Hash)
      self.highlights = opts[:highlights] || []
      self.disabled_if opts[:disabled_if]
      @html = opts[:html] || {} 
      @html[:title] = opts[:title]
      @html[:tab_index] = opts[:tab_index]
      yield(self) if block_given?

      self.highlights << @link if link? # it does highlight on itself
      raise ArgumentError, 'you must provide a name' unless @name
    end

    def tab_index
      @html[:tabindex]
    end
    
    def tab_index=(new_tab_index)
      @html[:tabindex]=new_tab_index
    end

    def title
      @html[:title]
    end
    
    def title=(new_title)
      @html[:title]=new_title
    end
    
    def ending
      @html[:ending]
    end
    
    def ending=(li)
      @html[:ending] = li
    end
        
    def links_to(l, lo = {})
       @link = l
       @link_options = lo
    end
    
    def set_before_link(bl)
      @before_link = bl
    end
    
    def set_after_link(al)
      @after_link = al
    end
    
    def no_before?
      @before_link.nil? || @before_link.empty?
    end
    
    def no_after?
      @after_link.nil? || @after_link.empty?
    end
    
    def named(n)
      @name = n
    end

    def titled(t)
      @html[:title] = t
    end
    
    def link?
      @link && !@link.empty?
    end
  end
end