require 'spec_helper'

describe WorkspacesController do

  describe "#create" do
    before do
      @user = FactoryGirl.create(:user)
    end

    it "should be ok" do
      sign_in @user

      get :new
      response.should be_success
    end
  end

end
