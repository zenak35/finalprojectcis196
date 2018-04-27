require 'rails_helper'

RSpec.describe "names/edit", type: :view do
  before(:each) do
    @name = assign(:name, Name.create!(
      :artist => nil,
      :playlist => nil
    ))
  end

  it "renders the edit name form" do
    render

    assert_select "form[action=?][method=?]", name_path(@name), "post" do

      assert_select "input[name=?]", "name[artist_id]"

      assert_select "input[name=?]", "name[playlist_id]"
    end
  end
end
