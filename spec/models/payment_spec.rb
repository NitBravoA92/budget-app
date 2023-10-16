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

  describe 'attributes validation' do
    it 'a payment transaction should not be valid without a name' do
      payment.name = nil

      expect(payment).to_not be_valid
    end

    it 'a payment transaction should not be valid if the name has more than 255 characters' do
      payment.name = 'Buy Lemon Candies' * 20

      expect(payment).to_not be_valid
    end

    it 'a payment transaction should not be valid without an amount' do
      payment.amount = nil

      expect(payment).to_not be_valid
    end

    it 'a payment transaction should not be valid if the amount is less than 0' do
      payment.amount = -3.90
      expect(payment).to_not be_valid
    end
  end
end
