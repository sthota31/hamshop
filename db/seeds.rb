# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def make_employees
  employees = [ "Alexandra Shook",
              "Ash Kamel",
              "Dan Morena",
              "Dave Miller",
              "David Kim",
              "Derek DiGioia",
              "Eric Resnick",
              "Igor Yuzovitskiy",
              "Ilana Seid",
              "Jaime Cohenca",
              "James Ingallinera",
              "Jason Leibowitz",
              "Jesse Sessler",
              "Lance Jordan",
              "Nathan Plutzik",
              "Paul Lee",
              "Spencer Stebbins",
              "Stephen Marsh",
              "Stephen Saunders",
              "Tadashi Okazaki",
              "Tommy Threadcraft",
              "Trinity Montoya",
              "Verner DSouza",
              "Vincent Trivett"  ]

  employees.each do |name|
    new_employee = Employee.new
    new_employee.first_name = name.split[0]
    new_employee.last_name = name.split[1]
    new_employee.age = rand(20) + 20
    new_employee.years_worked = rand(10) + 1
    new_employee.save!
  end
end

def make_locations
  Location.create!(name: "HAM-shop West", address: "10 E 21st St, New York, NY" )
  Location.create!(name: "HAM-shop South", address: "41 Union Square South, New York, NY" )
end

def make_products(num_per_location)
  adjectives = %w( red blue green orange yellow fancy simple new old greasy clean dirty)
  products = %w( banana orange apple kiwi durian-fruit tomato cucumber zuchini squash bread ham turkey bologna salsa chips)
  Location.all.each do |location|
    num_per_location.times do
      random_name = adjectives.sample(2).join(" ") + " " + products.sample
      new_product = Product.new(name: random_name , quantity: rand(20), price: rand(100)*100, location_id: location.id)
      new_product.save!
    end
  end
end


make_employees()
make_locations()
make_products(15)