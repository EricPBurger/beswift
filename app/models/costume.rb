class Costume < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  validates :costume_name, :origin, :price, :user_id, :availability, presence: true
  validates :price, numericality: { only_integer: true, greater_than: 0 }
end
