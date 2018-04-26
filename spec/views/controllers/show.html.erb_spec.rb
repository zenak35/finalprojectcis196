require 'rails_helper'

RSpec.describe "controllers/show", type: :view do
  before(:each) do
    @controller = assign(:controller, Controller.create!(
      :welcome => "Welcome",
      :index => "Index"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Welcome/)
    expect(rendered).to match(/Index/)
  end
end
