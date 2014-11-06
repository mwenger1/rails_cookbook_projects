class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  include Concerns::Access
  # GET /restaurants
  # GET /restaurants.json
  def index
    @organization = current_user.organizations.first.name
    if params[:id].present?
      @restaurants = @tenant.restaurants.find(params[:id])
    else
      @restaurants = Restaurant.all
    end
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
    @menus = Menu.where(:restaurant_id => @restaurant.id)
  end

  def export_menus
    @menus = Menu.where(:restaurant_id => params[:restaurant_id])
    respond_to do |format|
      format.html
      format.csv { render text: @menus.export_to_csv }
    end
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
    @organization = current_user.organizations.first.id
  end

  # GET /restaurants/1/edit
  def edit
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.organization_id = current_user.organizations.first.id

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
        format.json { render action: 'show', status: :created, location: @restaurant }
      else
        format.html { render action: 'new' }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :description, :organization_id,
                                         :users_attributes => [:id, :name, :email, :password, :password_confirmation, :remember_me]
)
    end
end
