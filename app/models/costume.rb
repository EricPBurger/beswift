class Costume < ApplicationRecord
  include AlgoliaSearch
  has_one_attached :photo
  belongs_to :user
  has_many :bookings
  validates :costume_name, :origin, :price, :user_id, :availability, :photo, presence: true

  after_save :load_algolia

  algoliasearch per_environment: true do
    attribute :costume_name, :origin, :price, :desc_short, :desc_long, :size, :availability
  end

  def formatted_price
    '%.2f' % self.price
  end

  private

  def load_algolia
    index = Algolia::Index.new("_COSTUMES")
    index.add_object(self)
  end
end
