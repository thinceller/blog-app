class ArticlesController < ApplicationController

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

  private

    def article_params
      params.require(:article).permit(:title, :body)
    end
end
