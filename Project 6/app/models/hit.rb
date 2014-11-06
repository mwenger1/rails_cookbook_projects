class Hit
  include Mongoid::Document
  field :ip, type: String
  field :user_id, type: String
end
