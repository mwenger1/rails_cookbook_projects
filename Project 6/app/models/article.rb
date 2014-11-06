class Article
  include Mongoid::Document
  include Mongoid::Slug

  field :title, type: String
  field :body, type: String
  field :_slugs, type: Array, default: []
  field :user_id, type: String
  
  is_impressionable
  
  slug  :title, :history => true
  belongs_to :user
  has_many :clicks

  def track_clicks_per_article
    clicks =  Click.where(article_id: "#{self.id}")
    click_count = clicks.length
    return click_count
  end
  
   def track_impressions_per_article
    impression_count = impressions.count
    return impression_count
  end
  
 def self.impressions_per_article_per_day 
  map = %Q{
  function() {
    emit({created_at: this.created_at.getDate()}, {count: 1}); 
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
  
  click_count = Impression.map_reduce(map, reduce).out(inline: true)
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
  
  unique_impressions = Impression.map_reduce(map, reduce).out(inline: true)
  return unique_impressions
 end
  
end
