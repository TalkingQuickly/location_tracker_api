# Travel Tracker API Server

This is an example API implementation for the React Native & React Web
GPS tracker application available at
<https://github.com/TalkingQuickly/location_tracker_app>.

## Setup

1. Clone the repository
2. Perform standard Rails application setup (database configuration etc)
3. run `bundle exec rake geonames_dump:import:cities`
4. run `rake geonames_dump:import:countries`
5. Fire up a Rails console and create a new user:

```
User.create(email: 'user@example.org', password: 'somepassword', password_confirmation: 'somepassword')
```

6. Start a server `bundle exec rails server`

You're now ready to fire up the client application from
<https://github.com/TalkingQuickly/location_tracker_app>

