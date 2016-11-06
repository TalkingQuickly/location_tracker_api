class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.json :raw
      t.float :lat
      t.datetime :timestamp

      t.timestamps
    end
  end
end
