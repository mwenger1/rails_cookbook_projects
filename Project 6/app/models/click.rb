class Click
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Geocoder::Model::Mongoid
  include RecordData

  field :ip, type: String
  field :url, type: String
  field :article_id, type: String
  field :user_id, type: String
  field :coordinates, :type => Array
  field :country, type: String
  field :city, type:String
  
  belongs_to :article
  
  geocoded_by :ip,
  :latitude => :lat, :longitude => :lon
  reverse_geocoded_by :coordinates do |obj,results|
  if geo = results.first
    obj.country = geo.country_code
  end
 end
 after_validation :geocode, :reverse_geocode

 def self.clicks_per_article_per_day 
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
 
 def self.clicks_per_country
  map = %Q{
  function() {
    emit({country: this.country}, {count: 1}); 
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
  
  unique_clicks = self.map_reduce(map, reduce).out(inline: true)
  return unique_clicks
 end

@daily_clicks =  Click.clicks_per_article_per_day
    @click_data = []

    @daily_clicks.each do |d|
      id = d["_id"]
      daily_clicks = d["value"]
      date = id["created_at"]
      clicks = daily_clicks["count"]
      @click_data <<  {:date => date.to_i, :clicks => clicks.to_i}
    end

 def self.get_click_data
   daily_clicks = self.clicks_per_article_per_day
   click_data = []

   daily_clicks.each do |d|
    id = d["_id"]
    daily_clicks = d["value"]
    date = d["_id"]["created_at"]
    clicks = daily_clicks["count"]
    click_data <<  {:date => date.to_i, :clicks => clicks.to_i}
   end
   return click_data
 end 
end
