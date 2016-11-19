class Location < ApplicationRecord
  belongs_to :user
  belongs_to :geonames_city, optional: true
  belongs_to :geonames_country, optional: true
end
