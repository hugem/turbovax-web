# Turbovax web

This is an example implement of an end-to-end web vaccine appointment website. It includes:

1) Web server with HTML and JSON endpoints
2) Scraper setup
3) Twitter integration
4) Background job orchestration

Fork this repo to create your very own TurboVax implementation.

## Dependencies

* [Ruby](https://www.ruby-lang.org/en/downloads/) ([rbenv](https://github.com/rbenv/rbenv) recommended)
* [Redis](https://redis.io/topics/quickstart)
* [Postgres](https://www.postgresql.org/download/)

## Installation

```
~ gem install foreman
~ bundle install && bundle exec rails db:create && bundle exec rails db:migrate
~ foreman start
```

Go to [localhost:3000](http://localhost:3000/)
## Overview
Using the [turbovax gem](https://github.com/hugem/turbovax-gem), we can set up the scraper to pull data from [turbovax.info](http://api.turbovax.info/v1/test.json) test API endpoint.
### Gem Implementation
* [`TestPortal`](https://github.com/hugem/turbovax-web/blob/main/app/models/portals/test_portal.rb): where the scraper is configured
### Rails Models/Controllers/Services
* [`Location`](https://github.com/hugem/turbovax-web/blob/main/app/models/location.rb): location data is saved into the database via this ActiveRecord model
* [`LocationController`](https://github.com/hugem/turbovax-web/blob/main/app/controllers/locations_controller.rb): fetches location records on page load
* [`locations/index.html`](https://github.com/hugem/turbovax-web/blob/main/app/views/locations/index.html.erb): HTML view of location
* [`SaveLocationDataService`](https://github.com/hugem/turbovax-web/blob/main/app/services/save_location_data_service.rb): Given a `Turbvax::Location` object, saves it as a `Location` database record
### Background jobs
* [`GetPortalDataJob`](https://github.com/hugem/turbovax-web/blob/main/app/jobs/get_portal_data_job.rb): this is the Sidekiq job that handles the fetching of data from API
* [sidekiq.yml](https://github.com/hugem/turbovax-web/blob/main/config/sidekiq.yml): schedules jobs via cron (currently set to execute every minute)

## License

This gem is licensed according to [GNU General Public License v3.0](https://github.com/hugem/turbovax-gem/blob/main/LICENSE).

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/hugem/turbovax-web](https://github.com/hugem/turbovax-web).
