class Category < ApplicationRecord
  belongs_to :user

  validates :name, :icon, presence: true, 
  validates :name, length: { maximum: 255 }

end
