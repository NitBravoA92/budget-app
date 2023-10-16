require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { create(:category) }

  describe 'category' do
    it 'should be a valid instance of Category class' do
      expect(category).to be_a(Category)
    end

    it 'should belong to a valid user' do
      expect(category.user).to be_a(User)
      expect(category.user.name).to eq('James Williams')
    end
  end

  describe 'attributes validation' do
    it 'a category should not be valid without a name' do
      category.name = nil

      expect(category).to_not be_valid
    end
  end
end
