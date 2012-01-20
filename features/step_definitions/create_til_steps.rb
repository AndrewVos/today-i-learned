Given /^I learned that "([^"]*)"$/ do |piece_of_knowledge|
  @piece_of_knowledge = piece_of_knowledge
end

When /^I save this in a TIL$/ do
  save til
end

Then /^I should see that "([^"]*)"$/ do |text|
  page.should have_content text
end

def save til
  visit "/tils/new"
  fill_in "TIL", :with => til
  click_button "Save"
end

def til
  @piece_of_knowledge
end
