require 'test_helper'

# Test login page redirects
class LoginControllerTest < ActionDispatch::IntegrationTest
  test 'should return true' do
    assert true
  end

  test 'should get login page' do
    get '/login'
    ## Assert redirected to google auth page
    assert_redirected_to 'http://www.google.com'
  end
end
