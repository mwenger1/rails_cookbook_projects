module Ecom
  class Product
    include Mongoid::Document
    include Mongoid::Slug

    field :name, type: String
    field :description, type: String
    field :base_price, type: Float
    field :sku, type: String

    slug :name, history: true 
    belongs_to :category
    mount_uploader :image, ImageUploader
  end
end
