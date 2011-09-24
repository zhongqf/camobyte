class WorkspacesController < ApplicationController
  inherit_resources
  custom_actions :resource => [:transfer, :invite, :join], :collection => :list

  before_filter :authenticate_user!

end
