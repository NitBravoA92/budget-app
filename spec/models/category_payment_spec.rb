require 'rails_helper'

RSpec.describe CategoryPayment, type: :model do
  let(:user) { create(:user) }
  let(:payment) { create(:payment, author: user) }
  let(:category_payment) { create(:category_payment, payment:) }

  describe 'category_payment' do
    it 'should be a valid instance of CategoryPayment class' do
      expect(category_payment).to be_a(CategoryPayment)
    end

    it 'should have a valid category' do
      expect(category_payment.category).to be_a(Category)
    end

    it 'should have a valid payment' do
      expect(category_payment.payment).to be_a(Payment)
    end
  end

  describe 'associations' do
    it 'should belong to a category' do
      expect(CategoryPayment.reflect_on_association(:category).macro).to eq :belongs_to
    end

    it 'should belong to a payment' do
      expect(CategoryPayment.reflect_on_association(:payment).macro).to eq :belongs_to
    end
  end
end
