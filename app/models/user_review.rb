class UserReview < ApplicationRecord
  belongs_to :user
  belongs_to :rental
  has_many :rentals
end
