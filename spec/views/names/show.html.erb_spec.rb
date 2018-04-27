require 'rails_helper'

RSpec.describe "names/show", type: :view do
  before(:each) do
    @name = assign(:name, Name.create!(
      :artist => nil,
      :playlist => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
