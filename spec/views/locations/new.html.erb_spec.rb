require 'spec_helper'

describe "locations/new" do
  before(:each) do
    assign(:location, stub_model(Location).as_new_record)
  end

  it "renders new location form" do
    render

    assert_select "form[action=?][method=?]", locations_path, "post" do
    end
  end
end
