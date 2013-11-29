class CopyProductPriceToLineItem < ActiveRecord::Migration

  def change
  	add_column :line_items, :price, :decimal, default: 0
  	#for each line item
  	LineItem.all.each do |item|
	  #find a price related to that product ID and copy it to db
	  item.update_attributes(:price => item.product.price)
  	end  
  end
end  
