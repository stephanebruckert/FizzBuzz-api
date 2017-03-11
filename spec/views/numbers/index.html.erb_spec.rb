require 'rails_helper'

RSpec.describe "numbers/index", type: :view do
  before(:each) do
    assign(:numbers, [
      Numbers.create!(),
      Numbers.create!()
    ])
  end

  it "renders a list of numbers" do
    render
  end
end
