# frozen_string_literal: true

# Handle redirect login
class LoginController < ApplicationController
  def index
    if params[:email] && check_allowed(params[:email])
      redirect_to '/auth/google_oauth2'
    else
      render json: { error: 'Invalid User' }, status: :not_acceptable
    end
  end

  private

  def check_allowed(email)
    email == Rails.application.secrets.allowed_user
  end
end
