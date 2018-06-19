class ArticlesController < ApplicationController
  before_action :article_set, only: [:edit, :update, :show, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
    @article.pictures.build
  end

  def create
    @article = current_user.articles.create(article_params)
    redirect_to article_path(@article)

  end

  def edit
  end

  def update
    if current_user == @article.user
    @article.update_attributes(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def verify
    @article.update_columns(verfied: true)
    @articles = Article.all
  end


  def show
    @pic = @article.pictures.first
    # @comment = Comment.find(params[:id])
  end

  def destroy
    if current_user == @article.user
      @article.destroy
      @articles = Article.all
      respond_to do |format|
        format.js {render :layout => false}
      end
    end
  end

  private
   def article_params
    params.require(:article).permit(:title, :text, pictures_attributes: [:image, :_destroy])
   end

   def article_set
    @article = Article.find(params[:id])
   end

end
