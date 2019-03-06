require 'spec_helper'
require 'rails_helper'

feature "the sign up process" do 
  scenario "has a new user page" do 
    visit new_user_url
    expect(page).to have_content 'Sign Up!'
  end

  feature 'signing up a user' do
    before(:each) do
      visit new_user_url
      fill_in 'Email', :with => "testing@email.com"
      fill_in 'Password', :with => "biscuits"
      click_on "Sign Up"
    end

    scenario 'shows email on the homepage after signup' do 
      expect(page).to have_content "testing@email.com Profile"
    end

  end
end

feature 'logging in' do
  before(:each) do
      visit new_session_url
      fill_in 'Email', :with => "testing@email.com"
      fill_in 'Password', :with => "biscuits"
      click_on "Sign in"
    end
  scenario 'shows email on the homepage after login' do
    expect(page).to have_content "Sign in!"
  end

end

feature 'logging out' do
  before(:each) do
      visit new_user_url
      fill_in 'Email', :with => "testing@email.com"
      fill_in 'Password', :with => "biscuits"
      click_on "Sign Up"
    end

  scenario 'begins with a logged out state' do 
    click_on 'Log out'
    expect(page).to have_content "Sign in!"
  end

  scenario 'doesn\'t show username on the homepage after logout' do 
    click_on 'Log out'
    expect(page).not_to have_content 'Profile'
  end

end