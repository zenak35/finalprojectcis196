require 'rails_helper'

RSpec.describe "tracks/show", type: :view do
  before(:each) do
    @track = assign(:track, Track.create!(
      :name => "Name",
      :artist => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
  end
end