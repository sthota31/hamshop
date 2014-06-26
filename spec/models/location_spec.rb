require 'spec_helper'

describe Location  do

  describe "#new" do
    it "should have a name and address" do
      location = Location.new({name: "MyShop", address: "10 E 21st St., New York, NY"})
      expect(location.name).to eq("MyShop")
      expect(location.address).to eq("10 E 21st St., New York, NY")
    end
  end

  describe "#inventory_list" do
    it "should return no products when no products are present" do
      location = Location.new({name: "MyShop", address: "10 E 21st St., New York, NY"})
      expect(location.products.size).to eq(0)
    end
  end

  describe "#info" do
    it "should include id, name and address" do
      location = Location.new({name: "MyShop", address: "10 E 21st St., New York, NY"})
      expect(location.info).to include(location.id.to_s)
      expect(location.info).to include(location.name)
      expect(location.info).to include(location.address)
    end
  end

  # describe ".list" do
  #   it "should include info on multiple locations" do
  #     location1 = Location.create({name: "MyShop", address: "123 Main St."})
  #     location2 = Location.create({name: "OtherShop", address: "555 Park Pl."})
  #     expect(Location.list).to include(location1.info)
  #     expect(Location.list).to include(location2.info)
  #   end
  # end
end
