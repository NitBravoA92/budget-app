require 'rails_helper'

RSpec.describe Payment, type: :model do
  let(:user) { create(:user) }
  let(:payment) { create(:payment, author: user) }

  describe 'payment' do
    it 'should be a valid instance of Payment class' do
      expect(payment).to be_a(Payment)
    end

    it 'should belong to a valid user' do
      expect(payment.author).to be_a(User)
      expect(payment.author.name).to eq('James Williams')
    end
  end
end
