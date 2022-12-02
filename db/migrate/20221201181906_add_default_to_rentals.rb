class AddDefaultToRentals < ActiveRecord::Migration[7.0]
  def change
    change_column :rentals, :coverage, :integer, default: 25
    change_column :rentals, :excess, :float, default: 1000
  end
end
