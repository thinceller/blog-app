class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to root_url
  end

  def edit
    # 記事編集
  end

  def show
    @article = Article.find(params[:id])
  end

  private

    def article_params
      params.require(:article).permit(:title, :body)
    end
end
