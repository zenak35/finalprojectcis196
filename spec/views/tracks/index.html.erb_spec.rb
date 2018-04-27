require 'rails_helper'

RSpec.describe "tracks/index", type: :view do
  before(:each) do
    assign(:tracks, [
      Track.create!(
        :name => "Name",
        :artist => nil,
        :playlist => nil
      ),
      Track.create!(
        :name => "Name",
        :artist => nil,
        :playlist => nil
      )
    ])
  end

  it "renders a list of tracks" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
