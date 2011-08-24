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
  end

  def create
  end

  def update
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