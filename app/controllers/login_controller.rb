# Handle redirect login
class LoginController < ApplicationController
  def index
    redirect_to '/auth/google_oauth2'
  end
end
