class BackgroundsFacade
  attr_reader :location,
              :id

  attr_accessor :background

  def initialize(location)
    @location = location
    @id = location
  end

  def get_background
    flickr_service.background_image_by_city(@location)
  end

  private

  def flickr_service
    @flickr ||= FlickrService.new
  end
end
