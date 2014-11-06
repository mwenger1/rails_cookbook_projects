class HomeController < ApplicationController
  def index
  end
  
  def fetch_friend_data
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        =  Rails.application.secrets.twitter_consumer_key
      config.consumer_secret     =  Rails.application.secrets.twitter_consumer_secret
      config.access_token        = "#{current_user.oauth_token}"
      config.access_token_secret = "#{current_user.oauth_secret}"
    end
    @friends = client.friends.take(20)
    @friends.each do |f|
      location = f.location
      location_value = Geocoder.coordinates("#{location}")
      if location_value.present?
	      Friend.get_friend_data(f,location_value,current_user.id)
      end
    end
    redirect_to map_display_index_path
  end
end
