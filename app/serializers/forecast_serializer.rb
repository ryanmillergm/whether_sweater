class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
             :city,
             :state

end
