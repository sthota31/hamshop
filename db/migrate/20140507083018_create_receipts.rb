class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
    	t.text :products_info
      	t.integer  :employee_id
      	t.integer  :location_id
      	t.string  :customer_name
        t.decimal  :total_cost , :precision => 8, :scale => 2
        t.timestamps
    end
  end
end
