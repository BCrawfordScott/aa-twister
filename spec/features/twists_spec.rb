require 'rails_helper'
# this is capybara
# feature and scenario are equivalent to describe/it
# here, we only wanna test user experience
feature 'creating a twist', type: :feature do
  before :each do
    create :user
    log_in_user(User.last)
  end

  scenario 'it takes a body' do
    visit new_twist_url
    expect(page).to have_content('Create Twist')
    expect(page).to have_content('Body')
  end

  scenario 'it takes us to twist show' do
    make_twist("left pinky auburn")
    expect(page).to have_content "1 Single Twist"
    expect(page).to have_content "left pinky auburn"
  end
end

feature 'detwisting a twist', type: :feature do
  before :each do
    create :user
    log_in_user(User.last)
    make_twist("left foot delete button")
    click_button 'Delete Twist'
  end

  scenario 'detwists a twist' do
    save_and_open_page # uses launchy to open the page for us so we can see what capybara sees at this moment
    expect(page).to_not have_content "left foot delete button"
    expect(page).to have_content "All the twists"
  end
end
