module Concerns
  extend ActiveSupport::Concern

   module Subdomain
    def self.matches?(request)
      case request.subdomain
      when 'www', '', nil
        false
      else
        true
      end
    end
  end
  
  extend Subdomain
end
