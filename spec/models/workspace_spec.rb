require 'spec_helper'

describe Workspace do

  describe "basic associations and validations " do
    it { should belong_to(:owner) }
    it { should belong_to(:organization) }
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
    it { should validate_presence_of(:permalink) }
    it { should ensure_length_of(:name).is_at_least(4).is_at_most(20) }
    it { should ensure_length_of(:permalink).is_at_least(6).is_at_most(20) }
  end

  describe "create a workspace" do
    before do
      @owner = FactoryGirl.create(:user)
      @other = FactoryGirl.create(:user)
      @workspace = FactoryGirl.create(:workspace, :owner_id => @owner.id)
    end

    it "should belong to its owner" do
      @workspace.owner.should == @owner
      @workspace.owner?(@owner).should be_true
      @workspace.owner?(@other).should be_false
      @owner.reload   #why reload?
      @owner.owned_workspaces.should include(@workspace)

    end

    it "should include only owner into members" do
      @workspace.users.should include(@owner)
      @workspace.users.count.should == 1
      @owner.reload
      @owner.joined_workspaces.should include(@workspace)
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

  describe "invite member" do
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
  end

  describe "dismiss member" do
    it "should only dismiss members"
    it "should dismiss members only once"
    it "should not be member when dismissed."
    it "should be logged as lefting workspace when dismissed." 
    it "should remove the workspace from their workspaces and recent workspaces" 
  end

  describe "transfer ownership" do
    it "should transfer ownership from owner"
    it "should transfer ownership to an admin"
    it "should not transfer ownership to a member" 
    it "should not transfer ownership to a non-member"
    it "should not transfer ownership to a non-existing user"
  end

  describe "add task list" do
    describe "add task" do
    end
  end

  describe "archive workspace" do
  end

  describe "#destroy" do
  end

  describe "role and privileges" do

    it "should allow only owner to delete workspace"
    it "should allow only admin to edit workspace"
    it "should allow only admin to archive workspace"
    it "should allow only admin to invite members"
    it "should allow only member to create task and tasklist"
    it "should be notified to watchers when workspace updated"

  end

end
# == Schema Information
#
# Table name: workspaces
#
#  id                   :integer(4)      not null, primary key
#  organization_id      :integer(4)
#  owner_id             :integer(4)
#  name                 :string(255)
#  permalink            :string(255)
#  last_comment_id      :integer(4)
#  comments_count       :integer(4)      default(0)
#  members_count        :integer(4)      default(0)
#  watchers_ids         :string(255)
#  tasks_count          :integer(4)      default(0)
#  task_lists_count     :integer(4)      default(0)
#  conversations_count  :integer(4)      default(0)
#  last_conversation_id :integer(4)
#  track_time           :boolean(1)      default(FALSE)
#  archived             :boolean(1)      default(FALSE)
#  public               :boolean(1)
#  deleted              :boolean(1)      default(FALSE), not null
#  created_at           :datetime
#  updated_at           :datetime
#

