# frozen_string_literal: true

# Handle redirect login
class LoginController < ApplicationController
  def index
    if params[:email] && check_allowed(params[:email])
      redirect_to '/auth/google_oauth2'
    else
      redirect_to Rails.application.secrets.portfolio_redirect + '/?error=invalid_user'
    end
  end

  private

  def check_allowed(email)
    email == Rails.application.secrets.allowed_user
  end
end
