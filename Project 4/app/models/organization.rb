class Organization < ActiveRecord::Base
#   include Concerns::Access
  has_many :users
  has_one :plan
  resourcify
  
  has_and_belongs_to_many :users
  
  validates :name, presence: true

  def self.free_trial
    date_today = Date.today
    if TimeDifference(self.created_at, date_today).in_months == 1
      
       errors.add :base, "Unable to update your subscription. #{e.message}."
    end
  end
end
