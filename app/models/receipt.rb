class Receipt < ActiveRecord::Base
	belongs_to :employee
	belongs_to :laction


	def product_data(product_with_quantity_hash=[],emp=nil,loc=nil)
		self.products_info = ""
		self.total_cost = 0
		if product_with_quantity_hash and product_with_quantity_hash.size > 0
		product_with_quantity_hash.each do |pwq|
			if pwq[:pid] != nil
				product =  Product.find_by_id(pwq[:pid].to_i)
				if product.quantity and product.quantity.to_i > pwq[:qty].to_i
					self.products_info += description(product, pwq[:qty].to_i)
					self.total_cost += pwq[:qty].to_i * product.price
			   		product.quantity = product.quantity.to_i- pwq[:qty].to_i
			   		product.save
				end 
			end
		 end	
		end
		self.employee_id = emp.id
        self.location_id = loc.id
		self.save
	end

	def description(product, qty = 1)
	 return  "#{qty} x #{product.name} @ #{Money.new(product.price.to_f, "USD").format(:symbol => true)  if product.price}\n"
	end

end
