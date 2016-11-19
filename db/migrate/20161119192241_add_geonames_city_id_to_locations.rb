class AddGeonamesCityIdToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :geonames_city_id, :integer
    add_column :locations, :geonames_country_id, :integer
  end
end
