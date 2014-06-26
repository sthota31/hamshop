class Product < ActiveRecord::Base

	# Thise will help in feture who update and who created the product
	# has_many  :updaters,:class_name=>"User", :foreign_key => "updater_id"
	# has_many :users
	belongs_to :location

	validates :name, :price,  :quantity, :presence => true

	def price_in_dollars
  		Money.new(price.to_f, "USD").format(:symbol => true) if price
	end

	def price_in_dollars=(value)
  		self.price = value.match(/[0-9|\.]+/)[0].to_f*100 if value.present?
	end
	
	def info
     return "#{self.id}. #{self.name} Qty: #{self.quantity} @ #{self.price} each"
    end

end
