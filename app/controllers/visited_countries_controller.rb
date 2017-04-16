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
        arrived: country.arrived.strftime('%d/%m/%Y'),
        departed: country.departed&.strftime('%d/%m/%Y') || "Present",
        duration: '%.0f' % (duration(country.arrived, country.departed) /60.0/60/24)
      }
    end
  end

  def duration(arrived, departed)
    return departed - arrived if departed && arrived
    return Time.zone.now - arrived
  end
end
