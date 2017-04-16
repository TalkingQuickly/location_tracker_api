class VisitedCountriesController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: {
      data: cities
    }
  end

  def cities
    current_user.visited_countries.order('arrived DESC').first(10).collect do |city|
      {
        id: city.id,
        name: city.geonames_city.name,
        country: city.geonames_country.country,
        arrived: city.arrived,
        departed: city.departed
      }
    end
  end
end
