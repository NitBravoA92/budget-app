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

  describe 'associations' do
    it 'should have or belongs to many payments' do
      expect(Category.reflect_on_association(:payments).macro).to eq :has_and_belongs_to_many
    end

    it 'should belongs to a user' do
      expect(Category.reflect_on_association(:user).macro).to eq :belongs_to
    end
  end

  describe 'attributes validation' do
    it 'a category should not be valid without a name' do
      category.name = nil

      expect(category).to_not be_valid
    end

    it 'a category should be valid if the name is less than or equal to 255' do
      category.name = 'Fast Food' * 25

      expect(category).to be_valid
    end

    it 'a category should not be valid without an icon' do
      category.icon = nil

      expect(category).to_not be_valid
    end
  end
end
