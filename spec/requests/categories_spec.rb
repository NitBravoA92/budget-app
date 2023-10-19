require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  # request to: /categories
  describe 'GET /index' do
    before do
      user = FactoryBot.create(:user)
      FactoryBot.create(:category, user:)
      sign_in user
      get categories_path
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
      expected_result = 'CATEGORIES'
      expect(response.body).to include(expected_result)

      expected_result_categ = 'Category 1'
      expect(response.body).to include(expected_result_categ)
    end
  end
end
