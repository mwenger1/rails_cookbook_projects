class Event < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  acts_as_taggable
  
  belongs_to :organizers, class_name: "User"

  has_many :attendences
  has_many :users, :through => :attendances

  has_many :taggings
  has_many :tags, through: :taggings

  def self.tagged_with(name)
    Tag.find_by_name!(name).events
  end

  def self.tag_counts
    Tag.select("tags.name, count(taggings.tag_id) as count").
      joins(:taggings).group("taggings.tag_id")
  end
  
  def all_tags
    tags.map(&:name).join(", ")
  end
  
  def all_tags=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end
  
  def event_owner(organizer_id)
    User.find_by id: organizer_id
  end

  def self.pending_requests(event_id)
    Attendance.pending.where(event_id: event_id)
  end
  
  def self.show_accepted_attendees(event_id)
    Attendance.accepted.where(event_id: event_id)
  end
  
   def self.show_my_events(organizer_id)
    Event.where(organizer_id: organizer_id)
  end
end
