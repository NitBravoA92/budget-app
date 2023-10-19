require 'rails_helper'

describe "Visit the SplashScreen page", type: :feature do
  it 'should display the title of the page' do
    visit root_path
    expect(page).to have_content 'YouPayment'
  end

  it "should display the 'LOG IN' button" do
    visit root_path
    expect(page).to have_selector('a')
    expect(page).to have_content 'Log In'
  end

  it "should display the 'SIGN UP' button" do
    visit root_path
    expect(page).to have_selector('a')
    expect(page).to have_content 'Sign Up'
  end

  it "Clicking on the 'LOG IN' button should redirect to Log In page" do
    visit root_path
    click_link 'Log In'
    expect(page).to have_current_path(new_user_session_path)
  end

  it "Clicking on the 'SIGN UP' button should redirect to Sign Up page" do
    visit root_path
    click_link 'Sign Up'
    expect(page).to have_current_path(new_user_registration_path)
  end
end
