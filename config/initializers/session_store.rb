# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_pjeip_session',
  :secret      => '2461a4a2caf121fe0b5496a205deba36317c76ccd2273cfb9617c8d4e1b25ce4b5e8d9af417b3d439518c4eef81a03acb7ce58a5cf514344623f3be2bf93289e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
