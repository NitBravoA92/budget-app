class Payment < ApplicationRecord
  belongs_to :author

  validates :name, :amount, presence: true
  validates :name, length: { maximum: 255 }
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
