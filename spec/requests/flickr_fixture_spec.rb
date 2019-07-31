# json_forecast_response = File.open("./fixtures/flickr.json")
# ​
#     stub_request(:get, "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=#{ENV['FLICKR_API_KEY']}&per_page=1&format=json&nojsoncallback=1&tags=#{location}").
#         with(
#           headers: {
#          'Accept'=>'*/*',
#          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
#          'User-Agent'=>'Faraday v0.15.4'
#           }).
#         to_return(status: 200, body: json_forecast_response, headers: {})
# ​
#     background_img = File.open("./fixtures/coordinate_data.json")
