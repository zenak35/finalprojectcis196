require 'rails_helper'

RSpec.describe "tracks/edit", type: :view do
  before(:each) do
    @track = assign(:track, Track.create!(
      :name => "MyString",
      :artist => nil,
      :playlist => nil
    ))
  end

  it "renders the edit track form" do
    render

    assert_select "form[action=?][method=?]", track_path(@track), "post" do

      assert_select "input[name=?]", "track[name]"

      assert_select "input[name=?]", "track[artist_id]"

      assert_select "input[name=?]", "track[playlist_id]"
    end
  end
end
