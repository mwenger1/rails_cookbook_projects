class SiteDetailsController < ApplicationController
  before_action :set_site_detail, only: [:show, :edit, :update, :destroy]

  # GET /site_details
  # GET /site_details.json
  def index
    @site_details = SiteDetail.all
  end

  # GET /site_details/1
  # GET /site_details/1.json
  def show
  end

  # GET /site_details/new
  def new
    @site_detail = SiteDetail.new
  end

  # GET /site_details/1/edit
  def edit
  end

  # POST /site_details
  # POST /site_details.json
  def create
    @site_detail = SiteDetail.new(site_detail_params)

    respond_to do |format|
      if @site_detail.save
        format.html { redirect_to @site_detail, notice: 'Site detail was successfully created.' }
        format.json { render action: 'show', status: :created, location: @site_detail }
      else
        format.html { render action: 'new' }
        format.json { render json: @site_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /site_details/1
  # PATCH/PUT /site_details/1.json
  def update
    respond_to do |format|
      if @site_detail.update(site_detail_params)
        format.html { redirect_to @site_detail, notice: 'Site detail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @site_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /site_details/1
  # DELETE /site_details/1.json
  def destroy
    @site_detail.destroy
    respond_to do |format|
      format.html { redirect_to site_details_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site_detail
      @site_detail = SiteDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_detail_params
      params.require(:site_detail).permit(:title, :organization, :address, :facebook, :twitter, :google_plus, :skype, :linkedin, :google_analytics, :telephone)
    end
end
