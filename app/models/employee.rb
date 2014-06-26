class Employee < ActiveRecord::Base
 attr_accessor :full_name
 has_many :receipts
 validates :first_name,:last_name, :age,  :years_worked, :presence => true
 
  def full_name
    return "#{first_name} #{last_name}"
  end
 

  def info
    return "Employee #{id}: #{full_name}, age #{age} with #{years_worked} years of experience."
  end

end
