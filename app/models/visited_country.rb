class VisitedCountry < ApplicationRecord
  belongs_to :user
  belongs_to :geonames_country, optional: true
end
