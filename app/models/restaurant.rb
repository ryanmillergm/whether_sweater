class Restaurant
  def initialize(attributes = {})
    @city = attributes[:name]
    @name =  attributes[:location][:city]
    @address = attributes[:location][:address1]
  end
end
