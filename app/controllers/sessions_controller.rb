# frozen_string_literal: true

# Controls Login Call back
class SessionsController < ApplicationController
  def create
    ## Call back from google that user is verified
    @user = User.find_from_omniauth(auth)

    ## create json web token to send back to front end
    jwt = Auth.issue(user: @user.id, exp: experation)

    redirect_to Rails.application.secrets.portfolio_redirect + '/?token=' + jwt
  end

  def destroy
    reset_session
  end

  private

  def auth
    request.env['omniauth.auth']
  end

  def experation
    12.hours.from_now.to_i
  end
end
