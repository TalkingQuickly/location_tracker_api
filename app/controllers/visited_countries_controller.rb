class VisitedCountriesController < ApplicationController
  def index
    render json: {
      data: cities
    }
  end

  def cities
    current_user.visited_countries.order('arrived DESC').first(10).collect do |country|
      {
        id: country.id,
        name: country.geonames_country.country,
        arrived: country.arrived,
        departed: country.departed,
        duration: duration(country.arrived, country.departed)
      }
    end
  end

  def duration(arrived, departed)
    return departed - arrived if departed && arrived
    return Time.zone.now - arrived
  end
end
