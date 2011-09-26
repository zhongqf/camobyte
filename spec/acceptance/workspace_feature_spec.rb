require 'acceptance/acceptance_helper'

feature 'Creating a workspace' do
  background do
    @user = FactoryGirl.create(:user)
    login_as @user
    visit new_workspace_path
  end

  scenario 'should be error when workspace name is invalid' do
    page.should have_content("Create a workspace")
    fill_in "Workspace name", :with => "ab"
    click_button "Create workspace"
    page.should have_content("is too short")
  end

end
