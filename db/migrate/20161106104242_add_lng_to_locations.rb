class AddLngToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :lng, :float
  end
end
