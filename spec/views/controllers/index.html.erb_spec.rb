require 'rails_helper'

RSpec.describe "controllers/index", type: :view do
  before(:each) do
    assign(:controllers, [
      Controller.create!(
        :welcome => "Welcome",
        :index => "Index"
      ),
      Controller.create!(
        :welcome => "Welcome",
        :index => "Index"
      )
    ])
  end

  it "renders a list of controllers" do
    render
    assert_select "tr>td", :text => "Welcome".to_s, :count => 2
    assert_select "tr>td", :text => "Index".to_s, :count => 2
  end
end
