require 'rails_helper'

RSpec.describe Payment, type: :model do
  let(:user) { create(:user) }
  let(:payment) { create(:payment, author: user) }

  describe 'payment' do
    it 'should be a valid instance of Payment class' do
      expect(payment).to be_a(Payment)
    end
  end
end
