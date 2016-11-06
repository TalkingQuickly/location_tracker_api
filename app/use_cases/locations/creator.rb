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
        current_user.locations.create({
          lat: location["coords"]["latitude"],
          lng: location["coords"]["longitude"],
          timestamp: location["timestamp"],
          raw: location
        })
      end
    end

    private

    attr_reader :locations, :current_user
  end
end
