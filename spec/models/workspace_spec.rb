require 'spec_helper'

describe Workspace do

  describe "basic associations and validations " do
    it { should belong_to(:owner) }
    it { should have_many(:members) }
    it { should have_many(:users) }
  
    it { should have_many(:task_lists) }
    it { should have_many(:tasks) }
    
    it { should have_many(:invitations) }
    #it { should have_many(:uploads) }
    it { should have_many(:conversations) }
    #it { should have_many(:pages) }
    it { should have_many(:comments) }
  
    it { should have_many(:activities) }
  
  
    it { should validate_presence_of(:owner) }
    it { should validate_presence_of(:name) }
    it { should ensure_length_of(:name).is_at_least(4).is_at_most(20) }
    it { should ensure_length_of(:permalink).is_at_least(6).is_at_most(20) }
  end

  describe "create a workspace" do
    before do
      @owner = Factory(:user)
      @other = Factory(:user)
      @workspace = Factory(:workspace, :owner_id => @owner.id)
    end

    it "should belong to its owner" do
      @workspace.owner.should == @owner
      @workspace.owner?(@owner).should be_true
      @workspace.owner?(@other).should be_false
      @owner.reload   #why reload?
      @owner.workspaces.should include(@workspace)
    end

    it "should include only owner into members" do
      @workspace.users.should include(@owner)
      @workspace.users.count.should == 1
    end

    it "should fail if name or permalink was used" do
      FactoryGirl.create(:workspace, :name => @workspace.name).should be_invalid
      FactoryGirl.create(:workspace, :permalink => @workspace.permalink).shoudl be_invalid
      
      workspace = FactoryGirl.create(:workspace)
      worksapce.name = @workspace.name
      workspace.should be_invalid
      workspace.name = FactoryGirl.generate(:name)
      workspace.permalink = @workspace.permalink
      workspace.should be_invalid
      workspace.permalink = FactoryGirl.generate(:permalink)
      workspace.should be_valid

    end

  end

  describe "manage members" do

    describe "invite members" do

      it "should add users only once"
  
      describe "add user without being invited" do
        it "should be logged"
        it "should be member immediately"
        it "should has the workspace in their workspaces"
        it "should not be recent workspaces until making some stuff"
      end

      describe "add user with be invited" do
        it "should be logged"
        it "should not be member until invitation accepted"
      end
  
      describe "pre-invite users on project creation" do
        it "should create multi-invitations"
        it "should not invite same user twice" 
        it "should not invite a non-exiting user" 
      end
  
      describe "be members" do
      end
  
    end

    describe "dismiss members" do
      it "should only dismiss members"
      it "should dismiss members only once"
      it "should not be member when dismissed."
      it "should be logged as lefting workspace when dismissed." 
      it "should remove the workspace from their workspaces and recent workspaces" 

    end

  end

  describe "add task list" do
    describe "add task" do
    end
  end

  describe "archive workspace" do
  end

  describe "#destroy" do
  end

end
