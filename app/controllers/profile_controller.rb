# Send of Profile Information
class ProfileController < ApplicationController
  before_action :authenticate
  def index
    render json: {
      welcome: 'You made it',
      profile: {
        name: current_user.name,
        email: current_user.email
      }
    }
  end

  private

  def profile_params; end
end
