require 'spec_helper'

describe 'creating a workspace' do
  before do
    @current_user = FactoryGirl.create(:user)
    visit new_workspace_path
  end

  it 'should be error when workspace name is invalid' do
    fill_in "Workspace name", :with => ""
    click_button "Create workspace"
    page.should has_content?("can not be blank")
  end

end
