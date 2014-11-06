module RecordData
	extend ActiveSupport::Concern

	included do
	  def self.record(url, ip, country, city, article_id, user_id)
    	self.create!(url: url, ip: ip, country: country, article_id: article_id, user_id: user_id)
 	  end
	end
end