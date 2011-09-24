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

    it "should be logged" do
      Activity.last.user_group.should == @workspace
      Activity.last.target.should == @workspace
      Activity.last.user.should == @owner
      Activity.last.action.should == "create"
      Activity.last.comment_target.should == nil
    end

    it "should fail if name or permalink was used" do
      FactoryGirl.build(:workspace, :name => @workspace.name).should be_invalid
      FactoryGirl.build(:workspace, :permalink => @workspace.permalink).should be_invalid
      
      workspace = FactoryGirl.build(:workspace)
      workspace.name = @workspace.name
      workspace.should be_invalid
      workspace.name = FactoryGirl.generate(:name)
      workspace.permalink = @workspace.permalink
      workspace.should be_invalid
      workspace.permalink = FactoryGirl.generate(:permalink)
      workspace.should be_valid

    end

  end

  describe "invite member" do
    before do
      @owner = FactoryGirl.create(:user)
      @workspace = FactoryGirl.create(:workspace, :owner_id => @owner.id)
      @user = FactoryGirl.create(:user)
    end

    it "should add users only once" do
      member = @workspace.add_user(@user)
      member.user.should == @user
      member.user_group.should == @workspace
      @workspace.should have(2).users
      lambda { @workspace.add_user(@user) }.should_not change(@workspace, :users)
      lambda { @workspace.add_user(@user, :source_user => @owenr) }.should_not change(@workspace, :users)
    end
  
    describe "add user without being invited" do
      before do
        @member = @workspace.add_user(@user)
      end

      it "should be logged" do
        Activity.last.user_group.should == @workspace
        Activity.last.comment_target.should == nil
        Activity.last.target.should == @member
        Activity.last.user.should == @user
        Activity.last.action.should == "create"
        @member.reload.source_user.should == nil
      end

      it "should be member immediately" do
        @workspace.users.should include(@user)
      end

      it "should has the workspace in their workspaces" do
        @user.reload
        @user.joined_workspaces.should include(@workspace)
      end
      
      it "should not be recent workspaces until making some stuff"
    end

    describe "add user with be invited" do
      before do
        @member = @workspace.add_user(@user, :source_user => @owner)
      end

      it "should be logged" do
        Activity.last.user_group.should == @workspace
        Activity.last.comment_target.should == nil
        Activity.last.target.should == @member
        Activity.last.user.should == @user
        Activity.last.action.should == "create"
        @member.reload.source_user.should == @owner
      end
    end
  
    describe "pre-invite users on project creation" do
      before do
        @owner = FactoryGirl.create(:user)
        @user1 = FactoryGirl.create(:user)
        @user2 = FactoryGirl.create(:user)
        @user3 = FactoryGirl.create(:user)

        @workspace = FactoryGirl.create(:workspace, :owner_id => @owner.id, 
          :invite_users => [@user1.id, @user2.id],
          :invite_emails => "#{@user2.email} #{@user3.email} sampleuser@email.com" )
      end
      it "should create multi-invitations" do
        @workspace.should have(4).invitations
      end

      it "should not invite same user twice" do
        to_user2 = @workspace.invitations.select { |i| i.email == @user2.email  }
        to_user2.size.should == 1
      end

      it "should invite a non-exiting user" do
        to_sampleuser = @workspace.invitations.find_by_email 'sampleuser@email.com'
        to_sampleuser.invited_user.should be_nil
      end
    end
  end

  describe "dismiss member" do
    before do
      @owner = FactoryGirl.create(:user)
      @workspace = FactoryGirl.create(:workspace, :owner_id => @owner.id)
      @user = FactoryGirl.create(:user)
      @member = @workspace.add_user(@user)
      @non_member = FactoryGirl.create(:user)
    end

    it "should only dismiss members" do
      @workspace.should have(2).users
      @workspace.reload
      @workspace.remove_user(@user)
      @workspace.should have(1).users
      @workspace.users.should_not include(@user)
      @workspace.users.should_not include(@non_member)
      @workspace.remove_user(@non_member)
      @workspace.should have(1).users
      
      @user.reload
      @user.joined_workspaces.should_not include(@workspace)
    end

    it "should dismiss members only once" do
      @workspace.remove_user(@user)
      @workspace.remove_user(@user)
      @workspace.should have(1).user
      @workspace.users.should_not include(@user)
    end

    it "should be logged as lefting workspace when dismissed." do
      @workspace.remove_user(@user)
      Activity.last.user_group.should == @workspace
      Activity.last.comment_target.should == nil
      Activity.last.target.should == @member
      Activity.last.action.should == 'delete'
      Activity.last.user.should == @user
    end

  end

  describe "transfer ownership" do
    before do
      @owner = FactoryGirl.create(:user)
      @workspace = FactoryGirl.create(:workspace, :owner_id => @owner.id)
      @user = FactoryGirl.create(:user)
    end

    it "should transfer ownership to an admin" do
      @member = @workspace.add_user(@user, :role => Member::ROLES[:admin])
      @member.admin?.should be_true
      @workspace.admin?(@user).should be_true
      @workspace.transfer_to(@member)
      @workspace.owner.should == @user
    end

    it "should not transfer ownership to a member" do
      @member = @workspace.add_user(@user)
      @workspace.transfer_to(@member)
      @workspace.owner.should == @owner
    end

  end

  describe "add task list" do
    describe "add task" do
    end
  end

  describe "archive workspace" do
  end

  describe "#destroy" do
    before do
      @workspace = FactoryGirl.create(:workspace)
    end

    it "should delete associated stuffs"
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

