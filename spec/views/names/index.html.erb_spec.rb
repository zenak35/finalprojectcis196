require 'rails_helper'

RSpec.describe "names/index", type: :view do
  before(:each) do
    assign(:names, [
      Name.create!(
        :artist => nil,
        :playlist => nil
      ),
      Name.create!(
        :artist => nil,
        :playlist => nil
      )
    ])
  end

  it "renders a list of names" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
