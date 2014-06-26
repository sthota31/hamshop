require 'spec_helper'

describe Receipt do
  describe "#new" do
    it "can be created with a cust. name and employee (no products)" do
      employee = Employee.new({first_name: "John", last_name: "Smith", age: 40, years_worked: 4})
     
      receipt = Receipt.new(customer_name: "Bob Marley", employee: employee)

      expect(receipt.customer_name).to eq("Bob Marley")
      expect(receipt.employee).to eq(employee)
    end
  end

  describe "#add_products" do


    it "accepts an array of products and quantities" do
      employee = Employee.new({first_name: "John", last_name: "Smith", age: 40, years_worked: 4})
      employee.save
      location = Location.new({name: "MyShop", address: "10 E 21st St., New York, NY"})
      location.save
      receipt = Receipt.new(customer_name: "Bob Marley", employee: employee)
      product1 = Product.new({name: "banana", quantity: 10, price: 100, location: Location.first})
      product1.save

      product2 = Product.new({name: "banana", quantity: 10, price: 100, location: Location.first})
      product2.save

      to_sell = Product.all.limit(2)
      qty = 10

      products = to_sell.map{|p| {:pid=> p.id,:qty => qty}}
      expect(receipt.product_data(products,employee,location)).to be(true)
    end

    it "updates product_info with product name, quantity and price" do
      employee = Employee.new({first_name: "John", last_name: "Smith", age: 40, years_worked: 4})
      employee.save
      location = Location.new({name: "MyShop", address: "10 E 21st St., New York, NY"})
      location.save

      receipt = Receipt.new(customer_name: "Bob Marley", employee: employee)

      product1 = Product.new({name: "banana", quantity: 100, price: 100, location: Location.first})
      product1.save

      product2 = Product.new({name: "banana5", quantity: 100, price: 100, location: Location.first})
      product2.save


      to_sell = Product.all.limit(2)
      qty = 10

      products = to_sell.map{|p| {:pid=> p.id,:qty => qty}}
      receipt.product_data(products,employee,location)

      expect(receipt.products_info).to include(to_sell.first.name)
      expect(receipt.products_info).to include(to_sell[1].name)
      expect(receipt.products_info).to include(qty.to_s)
    end

    it "sets total price correctly" do
      employee = Employee.new({first_name: "John", last_name: "Smith", age: 40, years_worked: 4})
      employee.save
      location = Location.new({name: "MyShop", address: "10 E 21st St., New York, NY"})
      location.save
      receipt = Receipt.new(customer_name: "Bob Marley", employee: employee)
      product1 = Product.new({name: "banana", quantity: 100, price: 100, location: Location.first})
      product1.save

      product2 = Product.new({name: "banana3", quantity: 100, price: 100, location: Location.first})
      product2.save


      to_sell = Product.all.limit(2)
      qty = 10

      products = to_sell.map{|p| {:pid=> p.id,:qty => qty}}
      receipt.product_data(products,employee,location)

      total_cost = to_sell.map{|p| p.price * qty }.sum

      expect(receipt.total_cost.to_f).to eq(total_cost.to_f)
    end
  end

  describe "#receipt_text" do

  end
end