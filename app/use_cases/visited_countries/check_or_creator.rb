module VisitedCountries
  class CheckOrCreator
    def initialize(user, location)
      @user = user
      @location = location
    end

    def call
      return unless location.geonames_country
      if user.visited_countries.empty?
        return create_visited_country
      else
        return add_new_country_if_needed
      end
    end

    private

    def add_new_country_if_needed
      return if most_recent_country.geonames_country == location.geonames_country
      create_visited_country
      most_recent_country.update_attribute(
        :departed,
        location.created_at
      )
    end

    def create_visited_country
      user.visited_countries.create(
        geonames_country: location.geonames_country,
        arrived: location.created_at
      )
    end

    def most_recent_country
      @most_recent_country ||= user
        .visited_countries
        .order('arrived DESC')
        .first
    end

    attr_reader :user, :location

  end
end
