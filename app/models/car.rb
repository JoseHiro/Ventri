class Car < ApplicationRecord
  belongs_to :owner, class_name: :User, foreign_key: :user_id
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  MODELS = []

  def self.brands
    getting_models
  end

  private

  def self.getting_models
    all.map do |car|
      car.model
    end
  end
end
