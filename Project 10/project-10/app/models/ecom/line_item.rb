module Ecom
  class LineItem
    include Mongoid::Document
    include Mongoid::Timestamps
    
    field :purchase_id, type: String
    field :product_id, type: String
    field :price, type: Float

    belongs_to :purchase
    belongs_to :product
    
    def make_items(purchase_id, product_id, price)
      item = LineItem.new
      item.purchase_id = purchase_id
      item.product_id = product_id
      item.price = price
      item.save
    end
  end
end
