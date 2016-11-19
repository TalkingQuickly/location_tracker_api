class CreateVisitedCities < ActiveRecord::Migration[5.0]
  def change
    create_table :visited_cities do |t|
      t.integer :user_id
      t.integer :geonames_city_id
      t.integer :geonames_country_id
      t.datetime :arrived
      t.datetime :departed

      t.timestamps
    end
  end
end
