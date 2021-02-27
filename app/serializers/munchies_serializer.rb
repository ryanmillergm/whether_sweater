class MunchiesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :end

  attributes :restaurant_list do |object|
    object.get_restaurants
  end
end
