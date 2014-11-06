require "net/http"
require "uri"
class Admin::DashboardController < ApplicationController
  before_filter :authenticate_user!

  def index
    @articles = Article.all
  end
  
  def clicks
    @click_data=  Click.get_click_data
    # clicks_per_article_per_day
    # @click_data = []

    # @daily_clicks.each do |d|
    #   id = d["_id"]
    #   daily_clicks = d["value"]
    #   date = id["created_at"]
    #   clicks = daily_clicks["count"]
    #   @click_data <<  {:date => date.to_i, :clicks => clicks.to_i}
    # end
    respond_to do |format|
    	format.json { render json: @click_data }
     end
  end
  
  def impressions
    @daily_impressions =  Article.impressions_per_article_per_day
    @impressions_data = []

    @daily_impressions.each do |d|
      id = d["_id"]
      daily_impressions = d["value"]
      date = id["created_at"]
      impressions = daily_impressions["count"]
      @impressions_data <<  {:date => date.to_i, :impressions => impressions.to_i}
    end
    respond_to do |format|
 	format.json { render json: @impressions_data }
    end
  end
  
  def demographics
    @demographics =  Click.clicks_per_article_per_day
    @impressions_data = []

    @demographics.each do |d|
      id = d["_id"]
      demographics = d["value"]
      country = id["country"]
      visits = demographics["count"]
      @demographics <<  {:country => country, :visits => visits.to_i}
    end
    respond_to do |format|
 	format.json { render json: @demographics }
    end
  end
end
