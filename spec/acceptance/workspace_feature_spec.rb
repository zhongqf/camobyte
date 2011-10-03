require 'acceptance/acceptance_helper'

feature 'Creating a workspace' do
  background do
    login
    visit new_workspace_path
  end

  def create_workspace(name)
    fill_in "Workspace name", :with => name
    click_button "Create workspace"
  end

  scenario 'should be error when workspace name is invalid' do
    page.should have_content("Create a workspace")

    lambda {
      create_workspace("ab")
      page.should have_content("is too short")
    }.should_not change(Workspace, :last)

    lambda {
      create_workspace("")
      page.should have_content("can't be blank")
    }.should_not change(Workspace, :last)
  end

  scenario 'should go to invite member when name is valid' do
    lambda {
      create_workspace("Sample workspace") 
    }.should change(Workspace, :last)
    
    current_path.should == workspace_invite_members_path(Workspace.last)

  end

end

feature "Invite members to workspace" do
  background do
    login
    @workspace = FactoryGirl.create(:workspace)
    visit workspace_invite_members_path(@workspace)

    5.times do
      FactoryGirl.create(:user, :organization => @workspace.organization)
    end

    3.times do
      FactoryGirl.create(:user)
    end

  end

  scenario 'should display all organization people as checkbox' do
    within("#users") do
      @workspace.organization.people.each do |person|
        page.should have_content(person.display_name_and_email)
      end

      (People.all - @workspace.organization.people).each do |person|
        page.should have_no_content(person.display_name_and_email)
      end
    end
  end

  scenario 'should invite member by email' do

    lambda {
      fill_in "their email address", :with => "sample1@sample.com, sample2@sample.com"
      click_button "Send invitations"
    }.should change(Invitation, :count).by(2)

    current_path.should == workspace_path(@workspace)

  end

  scenario 'should invite member by checking on name' do
  end


end

