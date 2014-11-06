class SiteDetail
  include Mongoid::Document
  field :title, type: String
  field :organization, type: String
  field :address, type: String
  field :facebook, type: String
  field :twitter, type: String
  field :google_plus, type: String
  field :skype, type: String
  field :linkedin, type: String
  field :google_analytics, type: String
  field :telephone, type: String
  
  mount_uploader :logo, FileUploader
end
