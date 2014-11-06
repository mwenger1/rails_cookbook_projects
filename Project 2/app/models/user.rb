class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :attendences
  has_many :events, :through => :attendances
  has_many :organized_events, class_name: "Event", foreign_key: "organizer_id"

end
