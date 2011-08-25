class UsersController < ApplicationController
  
  before_filter :find_user, :only => [:show]
  
  def index
  end

  def show
    @profile = @user.profile
  end

  def new
  end

  def edit
    if params.has_key?(:sub_action)
      @sub_action = params[:sub_action]
    else
      render :file => "#{Rails.root}/public/404.html", :status => 404
    end
  end

  def create
  end

  def update
    @sub_action = params[:sub_action]
    success = current_user.update_attributes(params[:user])
    
    respond_to do |wants|
      wants.html {
        if success
          back = polymorphic_url [:account, @sub_action]
          flash[:success] = t('users.update.updated', :locale => current_user.profile.locale)
          redirect_to back
        else
          flash.now[:error] = t('users.update.error')
          render 'edit'
        end
      }
    end
    
  end

  def destroy
  end
  
  def dashboard
  end
  
  private
    def find_user
      unless @user = ( User.find_by_id(params[:id]) )#|| User.find_by_login(params[:id]) )
        flash[:error] = t('not_found.user')
        redirect_to root_path
      end
    end

end
