class Car < ApplicationRecord
  belongs_to :owner, class_name: :User, foreign_key: :user_id
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_car,
                  against: [ :brand, :model, :number_of_seats, :category, :color, :address],
                  using: {
                    tsearch: { prefix: true } # <-- now `superman batm` will return something!
                  }
end
