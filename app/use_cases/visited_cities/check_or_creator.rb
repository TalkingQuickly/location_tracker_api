module VisitedCities
  class CheckOrCreator
    def initialize(user, location)
      @user = user
      @location = location
    end

    def call
      if user.visited_cities.empty?
        return create_visited_city
      else
        return add_new_city_if_needed
      end
    end

    private

    def add_new_city_if_needed
      return if most_recent_city.geonames_city == location.geonames_city
      create_visited_city
      most_recent_city.update_attribute(
        :departed,
        location.created_at
      )
    end

    def create_visited_city
      user.visited_cities.create(
        geonames_city: location.geonames_city,
        geonames_country: location.geonames_country,
        arrived: location.created_at
      )
    end

    def most_recent_city
      @most_recent_city ||= user
        .visited_cities
        .order('arrived DESC')
        .first
    end

    attr_reader :user, :location

  end
end
