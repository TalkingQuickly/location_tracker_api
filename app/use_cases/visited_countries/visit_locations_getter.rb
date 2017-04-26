module VisitedCountries
  class VisitLocationsGetter
    def initialize(current_user, visit_id)
      @current_user = current_user
      @visit_id = visit_id
    end

    def call
      return most_recent_points unless visit_id
    end

    private

    attr_reader :current_user, :visit_id

    def most_recent_points
      current_user.locations.limit(1000)
    end

    def points_for_visit
      base_scope
        .merge(
          arrived_after_scope
        )
    end

    def base_scope
      current_user.locations
    end

    def arrived_after_scope
      current_user.locations.where(
        "arrived >= ?",
        visited_country.arrived
      )
    end

    def left_before_scope
      where(
        "departed < ?",
        visited_country.departed
      )
    end

    def in_country_scope
      where(
        "geonames_country_id = ?",
        visited_country.geonames_country_id
      )
    end

    def visited_country
      @visited_country ||= VisitedCountry.find(
        visit_id
      )
    end
  end
end
