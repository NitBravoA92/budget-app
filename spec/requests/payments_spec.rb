require 'rails_helper'

RSpec.describe 'Payments', type: :request do
  # request to: categories/:category_id/payments
  describe 'GET /index' do
    before do
      user = FactoryBot.create(:user)
      category = FactoryBot.create(:category, user:)
      payment = FactoryBot.create(:payment, author: user)
      CategoryPayment.create(category:, payment:)

      sign_in user
      get category_payments_path(category)
    end

    # test if the response status was correct (status 200)
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    # test if a correct template was rendered.
    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    # test If the response body includes correct content.
    it 'renders the index template with correct content' do
      expected_result = 'PAYMENTS'
      expect(response.body).to include(expected_result)

      expected_result_payment = 'Purchase of Burger King burger'
      expect(response.body).to include(expected_result_payment)
    end
  end

  # request to: /payments/new
  describe 'GET /new' do
    before do
      user = FactoryBot.create(:user)

      sign_in user
      get new_payment_path
    end

    # test if the response status was correct (status 200)
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    # test if a correct template was rendered.
    it 'renders the new template' do
      expect(response).to render_template(:new)
    end

    # test If the response body includes correct content.
    it 'renders the new template with correct content' do
      expected_result_title = 'ADD PAYMENT'
      expect(response.body).to include(expected_result_title)
    end
  end
end
