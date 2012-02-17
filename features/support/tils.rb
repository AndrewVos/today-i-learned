def edit content
  visit "/tils"
  click_link "Edit"
  fill_in "TIL", :with => content
  click_button "Save"
end

def save til, user_name=nil
  authenticate(user_name) if user_name
  visit "/tils/new"
  fill_in "TIL", :with => til
  click_button "Save"
end

def til
  @piece_of_knowledge
end
