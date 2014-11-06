class Pin < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  mount_uploader :image, ImageUploader
 
  belongs_to :board
  paginates_per 10

  searchable do 
   text :name, :image
   integer :board_id
  end
  
  def self.my_pins(board_id)
    self.where(board_id: board_id)
  end
  
  def self.board_owner(board_user_id)
    User.find_by id: board_user_id
  end
  
  def self.search_pin(search_key)
    @search = self.search do
      fulltext "#{search_key}"
    end
    @search.results
  end
  
  def repin_post
    @pin = Pin.new
    @pin.name = self.name
    @pin.board_id = params[:board_id]
    @pin.image = self.image
    @pin.save
  end
  
  def self.send_newsletter
    @user = User.all.to_a
    @user.each do |u|
      @pins = self.order('id ASC').limit(5)
      Newsletter.letter(u, @pins).deliver
    end
  end

end
