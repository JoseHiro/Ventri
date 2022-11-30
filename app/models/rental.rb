class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :car
  has_one :review
  
  def self.returned_cars?(user)
    resp = false
    user.rentals.each do |rental|
      if rental.returned
        resp = true
        break
      end
    end
    return resp
  end
end
