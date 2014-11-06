Ecom::Purchase.class_eval do
	scope :order_complete, -> {where(state: "order_placed")}
    
    state_machine :initial => :cart_in_progress do
      event :transaction_successful do
	      transition :cart_in_progress => :order_placed
      end
    end
 
    def self.find_with_product(product)
      self.line_items.where([product_id: product.id.to_s]) rescue nil
    end
     
    def recalculate_price!
      self.price_total = line_items.inject(0.0){|total, line_item| total += line_item.price }
      save!
    end
    
    def checkout!
      self.transaction_successful!
    end
    
    def display_name
      ActionController::Base.helpers.number_to_currency(price_total) + " - Order ##{id} (#{user.username})"
    end

end