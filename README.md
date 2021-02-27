# whether_sweater

## README

This app allows users to create an account & login, as well as fetch the forecast for a location and future forecast for a destination upon arrival using google geocoding and dark sky api. This app utilizes the yelp and google maps api's to find restaurants that are open upon arrival. The Flickr api is used to retrieve a background image of a city.

The app is deployed at https://whether-a-sweater.herokuapp.com/.

This project was part of Turing School of Software & Design's Back End Engineering program. I This is a backend project built using Ruby on Rails.

View the project at https://backend.turing.io/module3/projects/sweater_weather.

Here is a wireframe for the project:
![wireframe](./public/weather_frame.png)

To install: 
 - `clone this repo`
 - `$bundle`
 - `$bundle exec figaro install`
 
 * Database creation
 - `$bundle exec rails db:create`

* Database initialization
 - `$bundle exec rails db:migrate`

* How to run the test suite
 - `$bundle exec rspec`
 
 - Add your own API keys to `config/application.yml`:
 ```yml
GOOGLE_MAPS_API_KEY: <your google maps API key>
DARK_SKY_API_KEY: <your dark sky API key>
FLICKR_API_KEY: <your flickr API key>
FLICKR_SECRET: <your flickr secret>
YELP_CLIENT_ID: <your yelp client ID>
YELP_API_KEY: <your yelp API key>
 ```

* Ruby version: 2.4.1p111

* Deployment instructions
 - `$git push heroku master`
 - Add ENV variables with `$heroku config:set <KEY>=<value>`


