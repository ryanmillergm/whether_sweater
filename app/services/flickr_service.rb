class FlickrService
  def initialize
    @location = nil
  end

  def background_image_by_city(location)
    @location = location
    background_parameters
    fetch_data(background_parameters)
  end

  def fetch_data(parameters)
    response = conn.get('',parameters)
    JSON.parse(Hash.from_xml(response.body).to_json, symbolize_names: true)
  end

  def conn
    Faraday.new('https://www.flickr.com/services/rest/') do |f|
      f.adapter Faraday.default_adapter
    end
  end

  private

  def background_parameters
    array = [@location, "park", "downtown", "view"]
    parameters =  {
       method: "flickr.photos.getRecent",
       api_key: ENV['FLICKR_API_KEY'],
       per_page: 1,
       tags: array,
       safe_search: 3,
       tag_mode: "all",
       nojsoncallback: 1
     }
  end

















  # def background_image_by_city(location)
  #   @location = location
  #   fetch_data("https://api.flickr.com/services/rest/")
  #   # fetch_data("https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=#{ENV['FLICKR_API_KEY']}&per_page=1&format=json&nojsoncallback=1&tags=#{location}")
  # end

  # fetch_data("https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=#{ENV['FLICKR_API_KEY']}&per_page=1&format=json&nojsoncallback=1&tags=#{location}")
  #
  # private
  #
  # def parameters
  #   array = [@location, "park", "downtown", "view"]
  #   {
  #     method: "flickr.photos.getRecent",
  #     api_key: ENV['FLICKR_API_KEY'],
  #     per_page: 1,
  #     tags: array,
  #     safe_search: 3,
  #     tag_mode: "all",
  #     nojsoncallback: 1
  #   }
  # end
  #
  # def fetch_data(url)
  #   response = Faraday.get(url, parameters)
  #   JSON.parse(Hash.from_xml(response.body).to_json, symbolize_names: true)
  # end
end
