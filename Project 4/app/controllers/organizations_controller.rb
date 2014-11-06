class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:new] 

  # GET /organizations
  # GET /organizations.json
  def index
    @organizations = Organization.where(:name => request.subdomain).first
  end

  # GET /organizations/1
  # GET /organizations/1.json
  def show
  end

  # GET /organizations/new
  def new
    @organization = Organization.new
    @plan = Plan.where(:id=> params[:plan_id]).pluck(:name)
  end

  # GET /organizations/1/edit
  def edit
     @organization.users.each do |u|
      if u.plan_id.present?
	@plan = Plan.where(:id=> u.plan_id).pluck(:name)
      end
     end
  end

  # POST /organizations
  # POST /organizations.json
  def create
    @user = current_user
    @organization = Organization.new(organization_params)
    @organization.users << @user

     
    respond_to do |format|
      if @organization.save
        format.html { redirect_to @organization, notice: 'Organization was successfully created.' }
        format.json { render action: 'show', status: :created, location: @organization }
      else
        format.html { render action: 'new' }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organizations/1
  # PATCH/PUT /organizations/1.json
  def update
    respond_to do |format|
      if @organization.update(organization_params)
        format.html { redirect_to dashboard_path, notice: 'Organization was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.json
  def destroy
    @organization.destroy
    respond_to do |format|
      format.html { redirect_to organizations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organization_params
      params.require(:organization).permit(:name, :description, :plan_id, {:user_ids => []})
    end
end
