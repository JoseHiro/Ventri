class Car < ApplicationRecord
  geocoded_by :address
  belongs_to :owner, class_name: :User, foreign_key: :user_id
  after_validation :geocode, if: :will_save_change_to_address?
end
