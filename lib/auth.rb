require 'jwt'
## Authenticate encoding and decoding checked code from http://www.thegreatcodeadventure.com/jwt-auth-in-rails-from-scratch/
class Auth
  ALGORITHM = 'HS256'.freeze

  def self.issue(payload)
    JWT.encode(
      payload,
      auth_secret,
      ALGORITHM
    )
  end

  def self.decode(token)
    JWT.decode(
      token,
      auth_secret,
      true,
      {
        algorithm: ALGORITHM
      }
    ).first
  end

  private

  def self.auth_secret
    #ENV['JWT_SECRET_KEY']
    Rails.application.secrets.jwt_secret_key
  end
end
