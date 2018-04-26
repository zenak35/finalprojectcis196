require 'rails_helper'

RSpec.describe "playlists/index", type: :view do
  before(:each) do
    assign(:playlists, [
      Playlist.create!(
        :user => nil,
        :name => "Name"
      ),
      Playlist.create!(
        :user => nil,
        :name => "Name"
      )
    ])
  end

  it "renders a list of playlists" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
