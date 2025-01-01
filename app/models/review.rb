class Review < ApplicationRecord
  belongs_to :user
  belongs_to :property

  validates :content, presence: true
  validates :cleanliness_rating, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  validates :accuracy_rating, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  validates :checkin_rating, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  validates :communication_rating, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  validates :location_rating, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  validates :value_rating, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 5}

  after_commit :update_final_rating, on: [:create, :update]

  def update_final_rating
    total_points = cleanliness_rating +
                   accuracy_rating +
                   checkin_rating +
                   communication_rating +
                   location_rating +
                   value_rating
  
    update_column(:final_rating, (total_points / 6.0).round(2))
  end

end
