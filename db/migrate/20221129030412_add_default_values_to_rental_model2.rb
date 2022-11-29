class AddDefaultValuesToRentalModel2 < ActiveRecord::Migration[7.0]
  def change
    change_column_default :rentals, :start_milage, 0
    change_column_default :rentals, :end_milage, 0
  end
end
