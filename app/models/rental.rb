class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :car
  has_one :review
end
