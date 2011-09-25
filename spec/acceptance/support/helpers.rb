module HelperMethods
  # Put helper methods you need to be available in all acceptance specs here.
  
  def login_as(user)
    visit new_user_session_path
    fill_in "Email", :with => user.email
    fill_in "Password", :with => "papapa"
    save_and_open_page
    click_button "Sign in"
  end  

end

RSpec.configuration.include HelperMethods, :type => :acceptance