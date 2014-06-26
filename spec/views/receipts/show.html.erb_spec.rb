require 'spec_helper'

describe "receipts/show" do
  before(:each) do
    @receipt = assign(:receipt, stub_model(Receipt))
  end

  it "renders attributes in <p>" do
    render
  end
end
