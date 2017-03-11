require 'rails_helper'

RSpec.describe "numbers/edit", type: :view do
  before(:each) do
    @numbers = assign(:numbers, Numbers.create!())
  end

  it "renders the edit numbers form" do
    render

    assert_select "form[action=?][method=?]", numbers_path(@numbers), "post" do
    end
  end
end
