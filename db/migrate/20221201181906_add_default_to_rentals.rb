class AddDefaultToRentals < ActiveRecord::Migration[7.0]
  def change
    change_column :rentals, :coverage, :integer, default: 10
    change_column :rentals, :coverage, :float, default: 2000
  end
end
