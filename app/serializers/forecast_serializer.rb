class ForecastSerializer
  include FastJsonapi::ObjectSerializer

   attributes :forecast do |object|
     object.current_weather
     # object.get_forecast
   end
end
