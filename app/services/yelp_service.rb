class YelpService
  attr_reader :food,
              :location,
              :travel_time

  def initialize(food, location, travel_time)
    @food = food
    @location = location
    @travel_time = travel_time
    @id = location
  end

  def food_type
    @food.split(' ')[0]
  end

  def get_restaurant_list
    fetch_data("https://api.yelp.com/v3/businesses/search?location=#{@location}&term=food&categories=#{food_type}&open_at=#{@travel_time}&limit=3")
  end

  private

  def fetch_data(url)
    yelp_response = Faraday.get(url) do |f|
      f.headers = { Authorization: "Bearer #{ENV["YELP_API_KEY"]}" }
    end
    results = JSON.parse(yelp_response.body, symbolize_names: true)[:businesses]
    @restaurants = results.map do |result|
      Restaurant.new(result)
    end
    @restaurants
  end
end
