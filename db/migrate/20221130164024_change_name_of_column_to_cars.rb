class ChangeNameOfColumnToCars < ActiveRecord::Migration[7.0]
  def change
    rename_column :cars, :location, :address
  end
end
