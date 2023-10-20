require 'rails_helper'

describe "Visit the index page of 'categories'", type: :feature do
  before do
    user = FactoryBot.create(:user)
    @category = FactoryBot.create(:category, user:)
    login_as(user)
  end

  it 'should display the title of the page' do
    visit categories_path
    expect(page).to have_content 'CATEGORIES'
  end

  it "should display the 'ADD A NEW CATEGORY' button" do
    visit categories_path
    expect(page).to have_css('a[href="/categories/new"]')
    expect(page).to have_content 'Add a new category'
  end

  it "should display the 'Sign out' button" do
    visit categories_path
    expect(page).to have_css('a[href="/users/sign_out"]')
    expect(page).to have_content 'Sign Out'
  end

  it 'should display the list of category items' do
    visit categories_path
    expect(page).to have_css('.category')
    expect(page).to have_css('img')
    expect(page).to have_content 'Category 1'
    expect(page).to have_content 'Category 1'
    expect(page).to have_content '$0.0'
  end

  it "Clicking on the 'ADD A NEW CATEGORY' button should redirect to categories new page" do
    visit categories_path
    click_link 'Add a new category'
    expect(page).to have_current_path(new_category_path)
  end

  it "Clicking on the 'Sign Out' button should close the current session and redirect to Splash Screen page" do
    visit categories_path
    click_link 'Sign Out'
    expect(page).to have_current_path(root_path)
  end

  it 'Clicking on the a category item should redirect to the payments page' do
    visit categories_path
    click_link 'Category 1'
    expect(page).to have_current_path(category_payments_path(@category))
  end
end
