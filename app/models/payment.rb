class Payment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :categories, join_table: 'category_payments'

  validates :name, :amount, presence: true
  validates :name, length: { maximum: 255 }
  validates :amount, numericality: { greater_than: 0 }
end
