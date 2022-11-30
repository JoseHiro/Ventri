class Review < ApplicationRecord
  # belongs_to :writer, class_name: :User, foreign_key: :user_id
  belongs_to :user
  belongs_to :rental
end
