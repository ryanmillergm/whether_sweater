class Restaurant
  def initialize(attributes = {})
    @city = attributes[:location][:city]
    @name =  attributes[:name]
    @address = attributes[:location][:address1]
  end
end
