require 'spec_helper'

describe "employees/show" do
  before(:each) do
    @employee = assign(:employee, stub_model(Employee))
  end

  it "renders attributes in <p>" do
    render
  end
end
