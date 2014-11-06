module Concerns
  module Access
  extend ActiveSupport::Concern

  module ClassMethods
    def self.give_access_to(user)
      where("#{table_name}.organization_id IN (?)", user.organization_id)
    end
  end
 extend Access
  end
end
