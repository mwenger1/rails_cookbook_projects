class Restaurant < ActiveRecord::Base
  include Concerns::Access

  extend FriendlyId
  friendly_id :name, use: :slugged
  
  has_many :menus, dependent: :destroy
  belongs_to :organization
  resourcify
  
  validates :name, presence: true
end
