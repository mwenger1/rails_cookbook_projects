class HomeController < ApplicationController
  def index
    @pins = Pin.order(:created_at).page(params[:page])
  end
  
  def search
    if params[:search].blank?
      flash[:notice] = "Please Supply a Search term"
    else params[:search].present?
	@board = Board.search_board(params[:search])
	@pin = Pin.search_pin(params[:search])
	if @board.nil? && @pin.nil?
	  flash[:notice] = "No Results Found matching your query"
	else
	  flash[:notice] = "Following are the search results"
	  @search = @board + @pin
	end
    end
  end
end
