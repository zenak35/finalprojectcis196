require 'rails_helper'

RSpec.describe "tracks/new", type: :view do
  before(:each) do
    assign(:track, Track.new(
      :name => "MyString",
      :artist => nil,
      :playlist => nil
    ))
  end

  it "renders new track form" do
    render

    assert_select "form[action=?][method=?]", tracks_path, "post" do

      assert_select "input[name=?]", "track[name]"

      assert_select "input[name=?]", "track[artist_id]"

      assert_select "input[name=?]", "track[playlist_id]"
    end
  end
end
