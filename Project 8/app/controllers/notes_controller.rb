module Api
  module V1
   class NotesController < ApplicationController
#     before_filter :authenticate_user!
    before_action :set_note, only: [:show, :edit, :update, :destroy]
    doorkeeper_for :index, :show,    :scopes => [:public]
    doorkeeper_for :update, :create, :scopes => [:write, :update]

  # GET /notes
  # GET /notes.json
  def index
    @notes = Note.all
    
    render json: @notes
  end
  
  def new
    @part = Part.new
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
    # @note = Note.find(params[:id])

    render json: @note
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(note_params)

    if @note.save
      render json: @note, status: :created, location: @note
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    # @note = Note.find(params[:id])

    if @note.update(note_params)
      head :no_content
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note = Note.find(params[:id])
    @note.destroy

    head :no_content
  end
  
  private
  def set_note
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
