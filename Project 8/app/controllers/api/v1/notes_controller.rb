module Api
  module V1
   class NotesController < ApplicationController
#     before_filter :authenticate_user!
    before_action :set_page, only: [:show, :edit, :update, :destroy]
     doorkeeper_for :index, :show,    :scopes => [:public]
     doorkeeper_for :update, :create, :scopes => [:write, :update]
     respond_to :json
  # GET /notes
  # GET /notes.json
  def index
    respond_with Note.all
  end
  
  def show
    respond_with Note.find(params[:id])
  end

  def create
   respond_with Note.create(note_params)
  end

  def update
    respond_with Note.update(params[:id], note_params)
  end

  def destroy
     respond_with Note.destroy(params[:id])
  end
  
  private
  def set_page
   @note = Note.find(params[:id])
  end
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def note_params
    params.require(:note).permit(:title, :body, :category_id) if params[:note]
  end

  # Find the user that owns the access token
  def current_resource_owner
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
    end
  end
end
