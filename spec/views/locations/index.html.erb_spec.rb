require 'spec_helper'

describe "locations/index" do
  before(:each) do
    assign(:locations, [
      stub_model(Location),
      stub_model(Location)
    ])
  end

  it "renders a list of locations" do
    render
  end
end
