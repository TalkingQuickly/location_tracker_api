class GeonamesCity < GeonamesFeature
  reverse_geocoded_by :latitude, :longitude
end
