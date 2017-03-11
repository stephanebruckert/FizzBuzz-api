require "rails_helper"

RSpec.describe NumbersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/numbers").to route_to("numbers#index")
    end

    it "routes to #show" do
      expect(:get => "/numbers/1").to route_to("numbers#show", :id => "1")
    end

  end
end
