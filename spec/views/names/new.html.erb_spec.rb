require 'rails_helper'

RSpec.describe "names/new", type: :view do
  before(:each) do
    assign(:name, Name.new(
      :artist => nil,
      :playlist => nil
    ))
  end

  it "renders new name form" do
    render

    assert_select "form[action=?][method=?]", names_path, "post" do

      assert_select "input[name=?]", "name[artist_id]"

      assert_select "input[name=?]", "name[playlist_id]"
    end
  end
end
