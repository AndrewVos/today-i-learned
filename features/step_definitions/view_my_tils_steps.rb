Given /^"([^"]*)" has the following TILs:$/ do |user, table|
  tils = []
  table.hashes.each do |row|
    tils << Til.new(value: row['til'])
  end
  aidy = User.create(name: user, tils: tils)
end

When /^I log in as Aidy$/ do
  visit "/tils"
end

Then /^I should see Aidy's TILs$/ do
  aidy = User.first(:name => "Aidy")
  aidy.tils.each do |t|
    page.should have_content t.value
  end
end

Then /^I should not see Vos's TILs$/ do
  vos = User.first(:name => "Vos")
  vos.tils.each do |t|
    page.should_not have_content t.value
  end
end
