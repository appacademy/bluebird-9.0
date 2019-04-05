require 'rails_helper'

RSpec.feature "Sign Up" do
  background(:each) do #similar to before
    visit new_user_path 
  end
  scenario "should be a sign page" do
    expect(page).to have_content("Create New User")
  end

  scenario "contains a new user form" do
    expect(page).to have_content(/username/i)
    # regex (regular expressions) whoa
    expect(page).to have_content("Email")
    expect(page).to have_content("Age")
    expect(page).to have_content("Password")
  end

  scenario "fill in the new user form" do
    user_attr = FactoryBot.build(:user)
    fill_in("Username", with: user_attr.username)
    fill_in("Email", with: user_attr.email)
    fill_in("Age", with: user_attr.age)
    fill_in("Password", with: user_attr.password)
    # save_and_open_page
    click_button("Create Wizard")

    #saved it! find new user
    user = User.find_by(username: user_attr.username)
    expect(user).not_to be_nil
    
    #on the new user show page
    expect(current_path).to eq(user_path(user))
    
    #new user's username will show up ... somewhere
    expect(page).to have_content(user.username)
  end

  



end