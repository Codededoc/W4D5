require "rails_helper"

feature 'the signup process', type: :feature do
  before :each do
    create :user
    log_in_user(User.last) #< method comes from spec_helper
  end

  scenario 'has a new user page' do
    visit user_url(User.last)
    expect(page).to have_content('profile page')
  end

  feature 'signing up a user' do

    scenario 'shows username on the homepage after signup' do
      visit user_url(User.last)
      expect(page).to have_content(User.last.username)
    end
  end
end

feature 'logging in', type: :feature do
  before :each do
    create :user
    log_in_user(User.last) #< method comes from spec_helper
  end
  scenario 'shows username on the homepage after login' do
    visit user_url(User.last)
    expect(page).to have_content(User.last.username)
  end

end

feature 'logging out', type: :feature do
  before :each do
    create :user
    log_in_user(User.last)
    click_button 'Log out'
  end

  scenario 'begins with a logged out state' do
    expect(page).to_not have_content('profile page')
    expect(page).to have_content('Log in!')
  end

  scenario 'doesn\'t show username on the homepage after logout' do
    expect(page).to_not have_content(User.last.username)
  end

end
