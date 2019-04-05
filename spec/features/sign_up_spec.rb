require 'rails_helper'

RSpec.feature "SignUps", type: :feature do
  background :each do
    visit new_user_path
  end

  scenario 'has a user sign up page' do
    expect(page).to have_content('Sign Up')
  end

  scenario 'takes a username, password, email, and age' do
    expect(page).to have_content('Username:')
    expect(page).to have_content('Email:')
    expect(page).to have_content('Age:')
    expect(page).to have_content('Password:')
  end

  scenario 'redirect to user\'s show and displays username on success' do
    user = FactoryBot.build(:harry_potter)

    fill_in 'Username:', with: user.username
    fill_in 'Email:', with: user.email
    fill_in 'Age:', with: user.age
    fill_in 'Password:', with: user.password

    click_button 'Create Wizard'

    expect(page).to have_content(user.username)
    new_user = User.find_by(username: user.username)
    expect(current_path).to eq(user_path(new_user))
  end
end
