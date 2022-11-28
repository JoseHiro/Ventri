class Car < ApplicationRecord
  belongs_to :user
  alias_attribute :user_id, :owner_id
end
