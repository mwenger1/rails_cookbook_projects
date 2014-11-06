require 'csv'

class Menu < ActiveRecord::Base
  belongs_to :restaurant
  has_many :items, dependent: :destroy
  resourcify
  
  accepts_nested_attributes_for :items
  
  
  def self.export_to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |menu|
        csv << menu.attributes.values_at(*column_names)
      end
    end
  end
end
