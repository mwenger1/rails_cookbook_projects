class Item < ActiveRecord::Base
  belongs_to :menu
  resourcify
end
