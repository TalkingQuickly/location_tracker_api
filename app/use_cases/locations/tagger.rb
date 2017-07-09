module Locations
  class Tagger
    def initialize(location)
      @location = location
    end

    def call
      set_city
      set_country
      location.save
    end

    private

    attr_reader :location

    def set_city
      location.geonames_city = city_from_lat_lng(
        location.lat,
        location.lng
      )
    end

    def set_country
      location.geonames_country = country_from_city(
        location.geonames_city
      )
    end

    def city_from_lat_lng(lat,lng)
      GeonamesCity.near([lat, lng], 20).first
    end

    def country_from_city(city)
      return unless city
      GeonamesCountry.by_iso(city.country_code).first
    end
  end
end
