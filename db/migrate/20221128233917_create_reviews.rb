class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :rating, null: false
      t.text :feedback
      t.integer :writer_id, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
