# frozen_string_literal: true

require 'test_helper'

# Test login page redirects
class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test 'should return true' do
    assert true
  end
end
