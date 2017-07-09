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
          lat: location["latitude"],
          lng: location["longitude"],
          timestamp: location["time"],
          raw: location
        })
        Tagger.new(location).call
        loc = loc.reload
        VisitedCities::CheckOrCreator.new(
          current_user, loc
        ).call
        VisitedCountries::CheckOrCreator.new(
          current_user, loc
        ).call
      end
    end

    private

    attr_reader :locations, :current_user

  end
end
