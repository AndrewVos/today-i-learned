Given /^there is a user with name "([^"]*)" and password "([^"]*)"$/ do |user, pwd|
  User.create(:name => user, :password => pwd)
end

When /^I login as "([^"]*)" with password "([^"]*)"$/ do |user, pwd|
  visit '/login'
  fill_in 'user', :with => user
  fill_in 'pwd', :with => pwd
  click_button 'Login'
end

Then /^I should be logged in as "([^"]*)"$/ do |user|
  page.should have_content "Logged in as #{user}"
end
