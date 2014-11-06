class HomeController < ApplicationController
  def index
  	@plans = Plan.all.to_a
  end
end
