class Page
  include Mongoid::Document

  field :title, type: String
  field :body, type: String
  field :is_home, :type => Boolean, :default => false
  field :page_type, :type => String
  field :part_ids, :type => Array
  
  
  scope :home, ->{where(page_type: "Home")}
  
  validates :title, :presence => true
  validates :body, :presence => true

  has_many :child_page, :class_name => 'Page', :inverse_of => :parent_page
  belongs_to :parent_page, :class_name => 'Page', :inverse_of => :child_page
  
  has_many :parts
  accepts_nested_attributes_for :parts

  belongs_to :user
  
  PAGE_TYPE= %w(Home News Video Contact Team)
end
