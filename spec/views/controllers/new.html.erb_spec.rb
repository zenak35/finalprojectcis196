require 'rails_helper'

RSpec.describe "controllers/new", type: :view do
  before(:each) do
    assign(:controller, Controller.new(
      :welcome => "MyString",
      :index => "MyString"
    ))
  end

  it "renders new controller form" do
    render

    assert_select "form[action=?][method=?]", controllers_path, "post" do

      assert_select "input[name=?]", "controller[welcome]"

      assert_select "input[name=?]", "controller[index]"
    end
  end
end
