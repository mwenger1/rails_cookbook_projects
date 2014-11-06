class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:show, :index]
  impressionist :actions=>[:show]

  # GET /articles
  # GET /articles.json
  def index
    #if user_signed_in?
    #  @articles = Article.where(user_id: current_user.id)
    #else
      @articles = Article.all
    #end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @clicks = @article.track_clicks_per_article
    
    impressionist(@article,message:"A User has viewed your article")
  
    url = request.fullpath.to_s
    ip = request.remote_ip
    country = request.location.country
    city = request.location.city

    if user_signed_in? && (current_user.id != @article.user_id)
      Click.record(url, ip, country, city, @article.id, current_user.id.to_s)
    elsif !user_signed_in?
      Click.record(url, ip, country, city, @article.id, "anonymous")
    end
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render action: 'show', status: :created, location: @article }
      else
        format.html { render action: 'new' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :body, :_slugs, :user_id)
    end
end
