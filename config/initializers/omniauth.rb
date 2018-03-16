Rails.application.config.middleware.use OmniAuth::Builder do
  provider( 
    :google_oauth2,
    Rails.application.secrets.google_id,
    Rails.application.secrets.google_secret,
    { }
  )
end
