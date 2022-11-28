class CreateRentals < ActiveRecord::Migration[7.0]
  def change
    create_table :rentals do |t|
      t.references :user, null: false, foreign_key: true
      t.references :car, null: false, foreign_key: true
      t.boolean :owner_acceptance
      t.integer :start_milage
      t.integer :end_milage
      t.boolean :user_started_condition
      t.boolean :owner_started_condition
      t.boolean :user_end_condition
      t.boolean :owner_end_condition
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
