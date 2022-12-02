class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :car
  validates :start_date, :end_date, presence: true, availability: true
  validate :end_date_after_start_date
  # has_one :review

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

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end
