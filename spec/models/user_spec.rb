require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  describe 'user' do
    it 'should be a valid instance of User class' do
      expect(user).to be_a(User)
    end
  end

  describe 'attributes' do
    it 'name should have a correct value' do
      expect(user.name).to eq('James Williams')
    end

    it 'name should not be nil' do
      user.name = nil
      expect(user).to_not be_valid
    end

    it 'email should have a correct value' do
      expected_result = "james_#{user.id}@mail.com"

      expect(user.email).to eq(expected_result)
    end

    it 'password should have a correct value' do
      expect(user.password).to eq('james12345')
    end

    it 'confirmed_at should have a value different than nil' do
      expect(user.confirmed_at).to_not eq(nil)
    end
  end
end
