require 'rails_helper'

RSpec.describe PaymentCategory, type: :model do
  let(:user) { create(:user) }
  let(:payment) { create(:payment, author: user) }
  let(:payment_category) { create(:payment_category, payment:) }

  describe 'payment_category' do
    it 'should be a valid instance of PaymentCategory class' do
      expect(payment_category).to be_a(PaymentCategory)
    end

    it 'should have a valid category' do
      expect(payment_category.category).to be_a(Category)
    end

    it 'should have a valid payment' do
      expect(payment_category.payment).to be_a(Payment)
    end
  end

  describe 'associations' do
    it 'should belong to a category' do
      expect(PaymentCategory.reflect_on_association(:category).macro).to eq :belongs_to
    end

    it 'should belong to a payment' do
      expect(PaymentCategory.reflect_on_association(:payment).macro).to eq :belongs_to
    end
  end
end
