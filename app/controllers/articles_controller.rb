class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    @sorted_articles = @articles.sort_by { |article| -article[:id] }
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to articles_path
  end

  def edit
  end

  private

  def article_params
    #white list
    params.require(:article).permit(:title, :content)
  end
end
