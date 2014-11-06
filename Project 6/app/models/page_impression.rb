class PageImpression
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  field :impressionable_type, :type => String
  field :impressionable_id, :type => String
  field :user_id, :type => String
  field :controller_name, :type => String
  field :action_name, :type => String
  field :view_name, :type => String
  field :request_hash, :type => String
  field :ip_address, :type => String
  field :session_hash, :type => String
  field :message, :type => String
  field :referrer, :type => String

  index ({user_id: 1})
  
  def self.find_impressions
    return self.id
  end
  
 def self.impressions_per_article_per_day 
  map = %Q{
  function() {
    emit({created_at: this.created_at.getDate(), article_id: this.article_id}, {count: 1}); 
   }  
  }

 reduce = %Q{
   function(key, values) {
    var count = 0;
    values.forEach(function(v) {
      count += v['count'];
    });
    return {count: count};
   }
  }
  
  click_count = self.map_reduce(map, reduce).out(inline: true)
  return click_count
 end
 
  def self.unique_impressions_per_day
   map = %Q{
   function() {
    emit(this['_id']['created_at'], {count: 1});
   }
  }

 reduce = %Q{
   function(key, values) {
    var count = 0;
    values.forEach(function(v) {
      count += v['count'];
    });
    return {count: count};
   }
  }
  
  unique_impressions = self.map_reduce(map, reduce).out(inline: true)
  return unique_impressions
 end
 
end
