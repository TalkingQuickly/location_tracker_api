module Locations
  class Creator
    def initialize(locations, current_user)
      if locations.kind_of? Array
        @locations = locations
      else
        @locations = [locations]
      end
      @current_user = current_user
    end

    def call
      return false unless current_user
      locations.each do |location|
        loc = current_user.locations.create({
          lat: location["coords"]["latitude"],
          lng: location["coords"]["longitude"],
          timestamp: location["timestamp"],
          raw: location
        })
        loc.geonames_city = city_from_lat_lng(
          location["coords"]["latitude"],
          location["coords"]["longitude"]
        )
        loc.geonames_country = country_from_city(
          loc.geonames_city
        )
        loc.save
        VisitedCities::CheckOrCreator.new(
          current_user, loc
        ).call
      end
    end

    private

    attr_reader :locations, :current_user

    def city_from_lat_lng(lat,lng)
      GeonamesCity.near([lat, lng], 20).first
    end

    def country_from_city(city)
      GeonamesCountry.by_iso(city.country_code).first
    end
  end
end
