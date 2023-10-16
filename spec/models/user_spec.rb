require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  describe 'user' do
    it 'should be a valid instance of User class' do
      expect(user).to be_a(User)
    end
  end

    describe "attributes" do
    it 'should have a name with a correct value' do
      expect(user.name).to eq('James Williams')
    end
  end
end
