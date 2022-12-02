class AddCompletedToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :completed, :boolean, default: false, null: false
  end
end
