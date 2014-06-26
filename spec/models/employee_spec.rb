require 'spec_helper'

describe Employee  do

  describe "#new" do
    it "should have a name, age, and years_worked" do
      employee = Employee.new({first_name: "John", last_name: "Smith", age: 40, years_worked: 4})
      expect(employee.first_name).to eq("John")
      expect(employee.last_name).to eq("Smith")
      expect(employee.age).to eq(40)
      expect(employee.years_worked).to eq(4)
    end

  describe "#full_name"
    it "should have a full name attribute" do
      # DO NOT STORE THIS IN DATABASE! You should store first and last name separately, and think about how
      # to build this functionaltiy using standard ruby object features
      employee = Employee.new({first_name: "John", last_name: "Smith", age: 40, years_worked: 4})
      expect(employee.full_name).to eq("John Smith")
    end

   describe "#info"
    it "should have an info about a a saved employee" do
      employee = Employee.new({first_name: "John", last_name: "Smith", age: 40, years_worked: 4})
      employee.save #we have to save to generate an id to be used in the info string.
      expect(employee.info).to eq("Employee #{employee.id}: John Smith, age 40 with 4 years of experience.")
    end
  end

  # describe ".roster" do
  #  it "should contain info strings for multiple employees"  do
  #     employee1 = Employee.create({first_name: "John", last_name: "Smith", age: 40, years_worked: 4})
  #     employee2 = Employee.create({first_name: "Clarissa", last_name: "Mayer", age: 40, years_worked: 4})
  #     expect(Employee.roster).to include(employee1.info)
  #     expect(Employee.roster).to include(employee2.info)
  #  end
  # end
end