# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_test_rails_new_session',
  :secret      => '203eecde10e0171e8c8d2448c2c94cd9b2f575bf4d382d310c06ccb9f89d24fff9b737480c9ea65c0352f0e73e86fc6c97d8d6f5b5b44eacaf41668a0955f19b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

if defined? JRuby::Rack
  require 'action_controller/session/java_servlet_store'
  ActionController::Base.session_store = :java_servlet_store
end
