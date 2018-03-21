# Be sure to restart your server when you modify this file.


# Running bin/rake db:sessions:trim will delete all sessions that have not been updated in the last 30 days.
# The 30 days cutoff can be changed using the SESSION_DAYS_TRIM_THRESHOLD environment variable.
Rails.application.config.session_store :active_record_store, :key => '_rabbit_session'