Given /^I am currently "([^\"]*)"$/ do |email|
  @current_user = User.find_by_email(email) ||
                  (email == "zhongqf@gmail.com" ? Factory(:zhongqf) : Factory(:user) )
end


Given /^(?:I am|I'm) logged in as "([^\"]*)"$/ do |username|
  @current_user = User.find_by_login(username)
end