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

  def new; end

  def create; end

  def edit; end

  def update; end

  def destroy; end

  private

  def profile_params; end
end
