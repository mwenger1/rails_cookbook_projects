class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :home_page, :show]
  before_action :set_site, only: [:home_page, :show]
  layout 'page_layout', only: [:home_page, :show]

  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.all
  end

  def home_page
   expires_in 5.minutes
   sleep 15
   
   @page = Page.home.first rescue nil 
   cache_client = Dalli::Client.new('localhost:11211')
   
   cache_client.set('Home', @page)
   value = cache_client.get('Home')
 
   @pages = Page.all
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
   @pages = Page.all
   # @site = SiteDetail.first
   # render :layout => 'page_layout'
  end

  # GET /pages/new
  def new
    @page = Page.new
  end

  # GET /pages/1/edit
  def edit
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
        format.json { render action: 'show', status: :created, location: @page }
      else
        format.html { render action: 'new' }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:title, :body, :is_home, :parent_page_id, :page_type)
    end

    def set_site
      @site = SiteDetail.first
    end
end
