require 'rails_helper'

describe "Visit the new page of 'categories'", type: :feature do
  before do
    user = FactoryBot.create(:user)
    login_as(user)
  end

  it 'should display the title of the page' do
    visit new_category_path
    expect(page).to have_content 'ADD CATEGORY'
  end

  it "should display the 'Sign out' button" do
    visit new_category_path
    expect(page).to have_css('a[href="/users/sign_out"]')
    expect(page).to have_content 'Sign Out'
  end

  it 'should display the form to add a new category' do
    visit new_category_path

    expect(page).to have_selector('form')
    expect(page).to have_css('input[type="text"]')
    expect(page).to have_css('input[type="file"]')
    expect(page).to have_css('input[type="submit"]')
  end

  it 'Clicking on the back button (left arrow) should redirect to categories page' do
    visit new_category_path
    click_on(class: 'back_button')
    expect(page).to have_current_path(categories_path)
  end

  it "Clicking on the 'Sign Out' button should close the current session and redirect to Splash Screen page" do
    visit new_category_path
    click_link 'Sign Out'
    expect(page).to have_current_path(root_path)
  end

  it "Clicking on the 'SAVE' button should send the form and create a new category" do
    visit new_category_path

    within('form') do
      fill_in 'category[name]', with: 'Category 2'
      attach_file 'category[icon]', Rails.root.join('spec/icons/grocery_icon.jpg')
    end

    click_button 'Save'

    expect(page).to have_current_path(categories_path)
    expect(page).to have_content 'Category was successfully created.'
  end
end
