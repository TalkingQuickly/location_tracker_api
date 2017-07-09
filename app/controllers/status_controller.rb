class StatusController < ApplicationController
  def show
    render json: ::Status::IndexSerializer.new(
      current_user
    ).to_h
  end
end
