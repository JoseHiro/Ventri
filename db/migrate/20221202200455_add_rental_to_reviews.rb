class AddRentalToReviews < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :rental, null: false, foreign_key: true
  end
end
