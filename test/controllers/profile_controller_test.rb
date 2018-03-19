# frozen_string_literal: true

require 'test_helper'

# Test login page redirects
class ProfileControllerTest < ActionDispatch::IntegrationTest
  test 'should return true' do
    assert true
  end

  test 'should get root' do
    get root_path
    assert_response 401
  end
end
