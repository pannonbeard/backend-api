# frozen_string_literal: true

require 'test_helper'

# Test login page redirects
class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
      {
        :provider => 'google_oauth2',
        :uid => '52369',
        'info' => {
          'email' => @user.email,
          'name' => @user.name
        }
      }
    )
  end

  test 'should return true' do
    assert true
  end

  test 'should find user' do
    get '/auth/google_oauth2/callback'
    @request.env['omniauth.env'] = OmniAuth.config.mock_auth[:google_oauth2]

    assert_response :found
  end

  test 'should destroy session' do
    get '/logout'
    assert_redirected_to 'http://www.example-porfolio.com'
  end
end
