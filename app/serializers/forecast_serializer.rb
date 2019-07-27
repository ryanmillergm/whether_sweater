class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :city,
             :state

end
