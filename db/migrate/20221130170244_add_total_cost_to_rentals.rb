class AddTotalCostToRentals < ActiveRecord::Migration[7.0]
  def change
    add_column :rentals, :total_cost, :float
  end
end
