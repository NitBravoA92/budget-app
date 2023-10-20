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

  describe 'associations' do
    it 'should have or belongs to many categories' do
      expect(Payment.reflect_on_association(:categories).macro).to eq :has_and_belongs_to_many
    end

    it 'should belongs to an author(user)' do
      expect(Payment.reflect_on_association(:author).macro).to eq :belongs_to
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

    it 'a payment transaction should not be valid if the amount is less than or equal to 0' do
      payment.amount = 0
      payment.amount = -3.90
      expect(payment).to_not be_valid
    end
  end
end
