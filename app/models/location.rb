class Location < ActiveRecord::Base
 has_many  :products
 has_many  :receipts



  def info
    return "#{self.id}. #{self.name} #{self.address}"
  end
 
end
