# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  provider   :string(255)
#  uid        :string(255)
#

require 'test_helper'

# testing the user
class UserTest < ActiveSupport::TestCase
  test 'checking on auth' do
    @auth = {
      'provider' => 'test',
      'uid' => '12345'
    }
    @user = User.find_from_omniauth(@auth)
    assert users(:one).name == @user.name
  end

  test 'checking auth to create user' do
    @auth = {
      'provider' => 'test',
      'uid' => '52369',
      'info' => {
        'name' => 'Test',
        'email' => 'text@example.com'
      }
    }
    @user = User.find_from_omniauth(@auth)
    assert User.last.name == @user.name
  end
end
