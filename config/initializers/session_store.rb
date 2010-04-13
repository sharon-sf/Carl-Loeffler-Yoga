# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_yoga2_session',
  :secret      => '17d2315d6a4ace6dcf404209e0f93d9c5f436dbab0b6d11b015d837ae7bf5cf787923b03be362574d16e53d302c6d520f20552a0b40fee93880da731ee27257c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
