require 'rails_helper'

RSpec.describe "numbers/new", type: :view do
  before(:each) do
    assign(:numbers, Numbers.new())
  end

  it "renders new numbers form" do
    render

    assert_select "form[action=?][method=?]", numbers_index_path, "post" do
    end
  end
end
