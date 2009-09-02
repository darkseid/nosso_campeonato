# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_nosso_campeonato_session',
  :secret      => '24151a59b3db692e2cf531fdfc1f72f2494f2d09aa1f97bc0e6b2be730a61ebd1295d42781e84b76ae58f48963937ecf97c2ad82b909cb6f270874364ab5dab7'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
