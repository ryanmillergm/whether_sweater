class BackgroundsFacade
  attr_reader :location,
              :id

  attr_accessor :background

  def initialize(location)
    @location = location
    @id = location
  end

  def get_background
    Rails.cache.fetch("get_background", expires_in: 12.hours) do
      flickr_service.background_image_by_city(@location)
    end
  end

  private

  def flickr_service
    @flickr ||= FlickrService.new
  end
end
