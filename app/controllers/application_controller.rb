class ApplicationController < ActionController::Base
  protect_from_forgery
  
  layout :set_layout

  protected

    def set_layout
      devise_controller? ? "login" : "application"
    end
end
