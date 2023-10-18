class Category < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :payments, join_table: 'category_payments'
  has_one_attached :icon

  validates :name, :icon, presence: true
  validates :name, length: { maximum: 255 }

  #methods
  def total_amount
    payments.sum(:amount)
  end
end
