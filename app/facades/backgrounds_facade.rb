class BackgroundsFacade
  attr_reader :location

  def initialize(location)
    @location = location
    @background = get_background
  end

  def get_background
    flickr_service.background_image_by_city(@location)
  end

  private

  def flickr_service
    @flickr ||= FlickrService.new
  end


end
