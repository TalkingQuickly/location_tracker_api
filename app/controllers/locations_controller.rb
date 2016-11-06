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
end
