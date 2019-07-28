class BackgroundsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
             :background
end
