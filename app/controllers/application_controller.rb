class ApplicationController < ActionController::API
  def current_user
    User
      .where("token is not null")
      .where(token: token)
      .first
  end

  def token
    request.headers["Authorization"] || params[:token]
  end
end
