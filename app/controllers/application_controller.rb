class ApplicationController < ActionController::Base
  protect_from_forgery
  
  #layout :set_layout
  
  helper_method :render_to_string
  

  protected

    def set_layout
      devise_controller? ? "login" : "application"
    end
end
