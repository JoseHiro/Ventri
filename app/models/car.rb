class Car < ApplicationRecord
  belongs_to :owner, class_name: :User, foreign_key: :user_id
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many_attached :photos

  include PgSearch::Model
  pg_search_scope :search_by_car,
                  against: [ :brand, :model, :number_of_seats, :category, :color],
                  using: {
                    tsearch: { prefix: true } # <-- now `superman batm` will return something!
                  }
end
