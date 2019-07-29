class YelpService
  attr_reader :food,
              :location,
              :travel_time

  def initialize(food, location, travel_time)
    @food = food
    @location = location
    @travel_time = travel_time
  end

  def get_time
    Time.now + @travel_time
  end

  def find_restaurants
    binding.pry
    fetch_data("https://api.yelp.com/v3/businesses/search?location=#{@loation}&categories=#{@food}&open_at=#{get_time}&limit=3")
  end

  private

  def fetch_data(url)
    yelp_response = Faraday.get(url).each do |f|
      f.headers = { Authorization: "Bearer #{ENV["YELP_API_KEY"]}" }
    end
    results = JSON.parse(yelp_response.body, symbolize_names: true)[:businesses]

    @restaurants = results.each do |result|
      Restaurant.new(result)
    end
  end
end
