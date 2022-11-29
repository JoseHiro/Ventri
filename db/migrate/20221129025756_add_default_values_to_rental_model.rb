class AddDefaultValuesToRentalModel < ActiveRecord::Migration[7.0]
  def change
    change_column_default :rentals, :owner_acceptance, false
    change_column_default :rentals, :user_started_condition, false
    change_column_default :rentals, :owner_started_condition, false
    change_column_default :rentals, :user_end_condition, false
    change_column_default :rentals, :owner_end_condition, false
  end
end
