class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :location,
             :current_weather,
             :hourly_forecast,
             :daily_forecast

   # attributes :forecast do |object|
   #   object.current_weather
   #   object.get_hourly_forecast
   # end
end
