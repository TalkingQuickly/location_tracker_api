class LocationsController < ApplicationController
  def create
    if ::Locations::Creator.new(
      params["location"],
      current_user
    ).call
      render json: {}
    else
      render json: {}, status: 401
    end
  end

  def index
    render json: {
      data: current_user
        .locations
        .order(created_at: 'desc')
        .limit(100).collect do |location|
        {
          title: location.id,
          timestamp: location.timestamp,
          latitude: location.lat,
          longitude: location.lng
        }
      end
    }
  end
end
