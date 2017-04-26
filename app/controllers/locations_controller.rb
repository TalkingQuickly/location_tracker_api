class LocationsController < ApplicationController
  def create
    if ::Locations::Creator.new(
      params["_json"],
      current_user
    ).call
      render json: {}
    else
      render json: {}, status: 401
    end
  end

  def index
    render json: {
      data: visit_locations_getter
        .order(created_at: 'desc')
        .limit(1000).collect do |location|
        {
          title: location.id,
          timestamp: location.timestamp,
          latitude: location.lat,
          longitude: location.lng
        }
      end
    }
  end

  private

  def visit_locations_getter
    @visit_locations_getter ||=
      ::VisitedCountries::VisitLocationsGetter.new(
        current_user,
        params["visit_id"]
      ).call
  end
end
