Given /^there is a TIL$/ do
  @old_content = "sdfm welfwlfjwefwlef j"
  save @old_content
end

When /^I change its content to "([^"]*)"$/ do |new_content|
  @new_content = new_content
  edit new_content
end

Then /^its content is changed$/ do
  page.should_not have_content @old_content
  page.should have_content @new_content
end
