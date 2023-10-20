require 'rails_helper'

describe "Visit the index page of 'Payments'", type: :feature do
  before do
    user = FactoryBot.create(:user)
    @category = FactoryBot.create(:category, user:)
    payment = FactoryBot.create(:payment, author: user)
    CategoryPayment.create(category: @category, payment:)

    login_as(user)
  end

  it 'should display the title of the page' do
    visit category_payments_path(@category)
    expect(page).to have_content 'PAYMENTS'
  end

  it "should display the 'ADD A NEW TRANSACTION' button" do
    visit category_payments_path(@category)
    expect(page).to have_css('a[href="/payments/new"]')
    expect(page).to have_content 'Add a new transaction'
  end

  it "should display the 'Sign out' button" do
    visit category_payments_path(@category)
    expect(page).to have_css('a[href="/users/sign_out"]')
    expect(page).to have_content 'Sign Out'
  end

  it 'should display the name and total amount of the current category' do
    visit category_payments_path(@category)

    expected_category_name = @category.name
    expect(page).to have_content expected_category_name

    expected_total_amount = @category.total_amount
    expect(page).to have_content expected_total_amount
  end

  it 'should display the list of payments items by a category' do
    visit category_payments_path(@category)
    expect(page).to have_css('.payment')
    expect(page).to have_content 'Purchase of Burger King burger'
    expect(page).to have_content '$6.95'

    expected_date = @category.created_at.strftime('%d %b %Y')
    expect(page).to have_content expected_date
  end

  it "Clicking on the 'ADD A NEW TRANSACTION' button should redirect to payments new page" do
    visit category_payments_path(@category)
    click_link 'Add a new transaction'
    expect(page).to have_current_path(new_payment_path)
  end

  it 'Clicking on the back button (left arrow) should redirect to categories page' do
    visit category_payments_path(@category)
    click_on(class: 'back_button')
    expect(page).to have_current_path(categories_path)
  end
end
