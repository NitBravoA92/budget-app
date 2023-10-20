require 'rails_helper'

RSpec.describe 'Welcome', type: :request do
  # request to: /
  describe 'GET /' do
    before do
      get root_path
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
      expected_result = 'YouPayment'
      expect(response.body).to include(expected_result)

      expected_result_log_in = 'Log In'
      expect(response.body).to include(expected_result_log_in)

      expected_result_log_in = 'Sign Up'
      expect(response.body).to include(expected_result_log_in)
    end
  end
end
