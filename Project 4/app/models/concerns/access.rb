module Concerns
  extend ActiveSupport::Concern

  module Access
    def give_access_to(user)
      where("#{table_name}.organization_id IN (?)", user.organization_id)
    end
  end
 extend Access
end