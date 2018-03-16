## Main application controller
class ApplicationController < ActionController::API

  rescue_from JWT::ExpiredSignature, :with => :record_not_found

  def logged_in?
    !!current_user
  end

  def current_user
    if auth_present?
      user = User.find(auth["user"])
      if user
        @current_user ||= user
      end
    end
  end

  def authenticate
    render json: {error: "unauthorized"}, status: 401 unless logged_in?
  end

  private

  def token
    request.env["HTTP_AUTHORIZATION"].scan(/Bearer (.*)$/).flatten.last
  end

  def auth
    Auth.decode(token)
  end

  def auth_present?
    !!request.env.fetch("HTTP_AUTHORIZATION",  "").scan(/Bearer/).flatten.first
  end

  def record_not_found(error)
    render json: { error: error.message }, status: :not_acceptable
  end
end
