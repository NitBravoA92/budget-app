require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { create(:category) }

  describe 'category' do
    it 'should be a valid instance of Category class' do
      expect(category).to be_a(Category)
    end
  end
end
