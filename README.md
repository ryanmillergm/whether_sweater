# whether_sweater

## README

This app allows users to create an account & login, as well as fetch the forecast for a location and future forecast for a destination upon arrival using google maps and dark sky api. 

The app is deployed at https://whether-a-sweater.herokuapp.com/.

This project was part of Turing School of Software & Design's Back End Engineering program. See project spec [here](https://backend.turing.io/module3/projects/sweater_weather). It was completed in 7 days by Ryan Miller. This is a backend project built using Ruby on Rails.

View the project board at https://github.com/chakeresa/express_sweater_weather/projects/1.

Here is a wireframe for the project:
![wireframe](./public/weather_frame.png)

Things you may want to cover:


* Ruby version: 2.4.1p111

* System dependencies
 - UNIX terminal

* Configuration
 - `$bundle`
 - `$bundle exec figaro install`
 - Add your own API keys to `config/application.yml`:
 ```yml
GOOGLE_MAPS_API_KEY: <your google maps API key>
DARK_SKY_API_KEY: <your dark sky API key>
FLICKR_API_KEY: <your flickr API key>
FLICKR_SECRET: <your flickr secret>
YELP_CLIENT_ID: <your yelp client ID>
YELP_API_KEY: <your yelp API key>
 ```

* Database creation
 - `$bundle exec rails db:create`

* Database initialization
 - `$bundle exec rails db:migrate`

* How to run the test suite
 - `$bundle exec rspec`

* Services (job queues, cache servers, search engines, etc.)
 - To enable caching in the development environment, run `$rails dev:cache` once
 - In one terminal, run `$redis-server` (may need to do `$brew update && brew install redis` first)
 - In another terminal, run `$bundle exec sidekiq`
 - Initiate the daily image database refresh by running `$rake simple_scheduler`

* Deployment instructions
 - `$git push heroku master`
 - Add ENV variables with `$heroku config:set <KEY>=<value>`


