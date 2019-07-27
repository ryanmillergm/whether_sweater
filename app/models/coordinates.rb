class Coordinates
  attr_reader :latitude,
              :longitude,
              :id

  def initialize(attributes = {})
    @latitude = attributes[:lat]
    @longitude = attributes[:lng]
    @id = 1
  end
end
