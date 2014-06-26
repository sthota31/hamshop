class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.string :name
        t.string :quantity
        t.decimal  :price , :precision => 8, :scale => 2
      	t.integer  :employee_id
      	t.integer  :updater_id
        t.integer :location_id
        t.timestamps
    end
  end
end
