class PartType
  include Mongoid::Document
  field :name, type: String
  
  has_many :part
end
