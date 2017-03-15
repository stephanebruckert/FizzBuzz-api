require "rails_helper"

RSpec.describe API::NumbersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "api/numbers").to route_to("api/numbers#index")
    end

  end
end
