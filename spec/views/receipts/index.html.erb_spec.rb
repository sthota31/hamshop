require 'spec_helper'

describe "receipts/index" do
  before(:each) do
    assign(:receipts, [
      stub_model(Receipt),
      stub_model(Receipt)
    ])
  end

  it "renders a list of receipts" do
    render
  end
end
