class Board < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user
  has_many :pins
  
  #search rules
  searchable do
    text :title, :description
    integer :user_id
  end
  
  validates :title, presence: true
   
  def self.my_board(user_id)
    self.where(user_id: user_id)
  end
  
  def self.board_owner(user_id)
    User.find_by id: user_id
  end  
  
  def self.search_board(search_key)
   @search = self.search do
      fulltext "#{search_key}"
    end
    @search.results
  end
  
end
