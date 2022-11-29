class AddPicked < ActiveRecord::Migration[7.0]
  def change
    add_column :rentals, :picked, :boolean, default: false
    add_column :rentals, :returned, :boolean, default: false
  end
end
