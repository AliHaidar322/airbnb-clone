class Property < ApplicationRecord
  validates :name,
            :description,
            :headline,
            :address_1,
            :address_2,
            :city,
            :state,
            :country, presence: true

  monetize :price_cents, allow_nil: true

  has_many_attached :images

  has_many :reviews, dependent: :destroy
end
