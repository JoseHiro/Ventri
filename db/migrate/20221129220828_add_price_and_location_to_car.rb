class AddPriceAndLocationToCar < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :price, :float
    add_column :cars, :location, :string
  end
end
