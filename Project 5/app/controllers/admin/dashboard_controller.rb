class Admin::DashboardController < ApplicationController
  before_filter :authenticate_user!

  def index
    @pages = Page.all.desc('_id').limit(5)
    @parts = Part.all.desc('_id').limit(5)
  end
end
