class ApplicationController < ActionController::API
  def current_user
    User.where(token: params[:token]).first
  end
end
