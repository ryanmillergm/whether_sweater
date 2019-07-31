class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :location,
             :current_weather,
             :hourly_forecast,
             :daily_forecast

end
