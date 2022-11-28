class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :category
      t.string :brand
      t.string :model
      t.integer :year
      t.string :color
      t.integer :number_of_seats
      t.integer :number_of_doors
      t.integer :engine_size
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
