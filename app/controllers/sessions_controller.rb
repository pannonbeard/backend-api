# Controls Login Call back
class SessionsController < ApplicationController

  def create
    ## Call back from google that user is verified
    @user = User.find_from_omniauth(auth)
    #render json: @user

    ## create json web token to send back to front end
    if @user.email == 'phendricks@centralriversaea.org'
      jwt = Auth.issue(
        {
          user: @user.id,
          exp: experation
        }
      )
      render json: { jwt: jwt }
    end
  end

  private

  def auth
    request.env['omniauth.auth']
  end

  def experation
    12.hours.from_now.to_i
  end
end
