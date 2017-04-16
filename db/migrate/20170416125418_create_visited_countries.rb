class CreateVisitedCountries < ActiveRecord::Migration[5.0]
  def change
    create_table :visited_countries do |t|
      t.integer :user_id
      t.integer :geonames_country_id
      t.datetime :arrived
      t.datetime :departed

      t.timestamps
    end

    add_index :visited_countries, :user_id
    add_index :visited_countries, :geonames_country_id
  end
end
