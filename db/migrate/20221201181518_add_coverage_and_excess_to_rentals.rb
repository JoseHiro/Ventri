class AddCoverageAndExcessToRentals < ActiveRecord::Migration[7.0]
  def change
    add_column :rentals, :excess, :float
    add_column :rentals, :coverage, :integer
  end
end
