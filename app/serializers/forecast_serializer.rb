class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
             :latitude,
             :longitude

end
