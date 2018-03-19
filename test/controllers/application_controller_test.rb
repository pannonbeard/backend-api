# frozen_string_literal: true

require 'test_helper'

# Test login page redirects
class ApplicationControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test 'should return true' do
    assert true
  end

  test 'should get root' do
    get root_path
    assert_response 401
  end

  test 'should check authority' do
    @auth = Auth.issue(user: @user.id)
    @headers ||= {}
    @headers['Authorization'] = 'Bearer ' + @auth
    get '/', headers: @headers
    assert_response :success
  end

  test 'should check token expired' do
    @exp = 1.day.ago.to_i
    @auth = Auth.issue(user: @user.id, exp: @exp)
    @headers ||= {}
    @headers['Authorization'] = 'Bearer ' + @auth
    get '/', headers: @headers
    assert_response :not_acceptable
  end
end
