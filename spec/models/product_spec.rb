require 'spec_helper'

describe Product do
  describe "#new" do
    it "should have a name, price, quantity and location" do
      location = Location.new({name: "MyShop", address: "10 E 21st St., New York, NY"})
      location.save
      product = Product.new({name: "banana", quantity: 10, price: 100, location: Location.first})
      expect(product.name).to eq("banana")
      expect(product.quantity).to eq(10)
      expect(product.price).to eq(100)
      expect(product.location_id).to eq(Location.first.id)
    end
  end

  describe "#info" do
    it "should list name, quantity, and price" do
      product = Product.create({name: "banana", quantity: 777, price: 888, location: Location.first})
      expect(product.info).to include("banana")
      expect(product.info).to include("777")
      expect(product.info).to include("888")
      expect(product.info).to include(product.id.to_s)
    end
  end

end
