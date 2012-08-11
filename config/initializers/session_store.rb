# Be sure to restart your server when you modify this file.
# TODO: Adjust those configurations when the correct domain will be setted up. 
if Rails.env.development? || Rails.env.test?  
  # Pwa::Application.config.session_store :cookie_store, key: '_pwa_sessions', domain: 'lvh.me'
else
  # Pwa::Application.config.session_store :cookie_store, key: '_pwa_session', domain: 'tenddi.com'
end

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Pwa::Application.config.session_store :active_record_store
