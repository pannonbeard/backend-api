# frozen_string_literal: true

require 'test_helper'

# Test login page redirects
class LoginControllerTest < ActionDispatch::IntegrationTest
  test 'should return true' do
    assert true
  end

  test 'should get login page' do
    get '/login', params: {
      email: 'example@gmail.com'
    }
    ## Assert redirected to google auth page
    assert_redirected_to '/auth/google_oauth2'
  end

  test 'should push back from login page' do
    get '/login', params: {
      email: 'eampl3e@gmail.com'
    }
    ## Assert redirected to main profile page
    assert_response :found
  end
end
