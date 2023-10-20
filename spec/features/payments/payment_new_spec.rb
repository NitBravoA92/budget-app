require 'rails_helper'

describe "Visit the new page of 'payments'", type: :feature do
  before do
    @user = FactoryBot.create(:user)
    login_as(@user)
  end

  it 'should display the title of the page' do
    visit new_payment_path
    expect(page).to have_content 'ADD PAYMENT'
  end

  it "should display the 'Sign out' button" do
    visit new_payment_path
    expect(page).to have_css('a[href="/users/sign_out"]')
    expect(page).to have_content 'Sign Out'
  end

  it 'should display the form to add a new payment' do
    visit new_payment_path

    expect(page).to have_selector('form')
    expect(page).to have_css('input[type="text"]')
    expect(page).to have_css('input[type="number"]')
    expect(page).to have_css('select')
    expect(page).to have_css('input[type="submit"]')
  end

  it "Clicking on the 'Sign Out' button should close the current session and redirect to Splash Screen page" do
    visit new_payment_path
    click_link 'Sign Out'
    expect(page).to have_current_path(root_path)
  end

  it "Clicking on the 'SAVE' button should send the form and create a new payment" do
    category = FactoryBot.create(:category, user: @user)

    visit new_payment_path

    within('form') do
      fill_in 'payment[name]', with: 'Internet Bill'
      fill_in 'payment[amount]', with: 230.37
    end

    page.select 'Category 1', from: 'payment[category_id]'

    click_button 'Save'

    expect(page).to have_current_path(category_payments_path(category))
    expect(page).to have_content 'Payment was successfully created.'
  end
end
