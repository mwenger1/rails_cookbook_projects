class PageRelationship
  include Mongoid::Document
  field :parent_id, type: Integer
  field :child_id, type: Integer
  
  belongs_to :parent, :class_name => "Page"
  belongs_to :child, :class_name => "Page"
end
