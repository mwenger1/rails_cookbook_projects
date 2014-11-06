class Part
  include Mongoid::Document
  field :title, type: String
  field :part_type_id, type: String
  field :content, type: String
  field :meta, type: String
  field :user_id, type: String
  
  belongs_to :part_type
  belongs_to :page
 
end
