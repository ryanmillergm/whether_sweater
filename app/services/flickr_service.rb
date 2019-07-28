class FlickrService

  def background_image_by_city(location)
    fetch_data("https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=#{ENV['FLICKR_API_KEY']}&per_page=1&format=json&tags=#{location}")
  end

  private

  def fetch_data(url)
    response = Faraday.get(url)
    JSON.parse(response.body)
  end
end
