require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validates_presence_of :email }
    it { should validates_presence_of :password }
  end
end
