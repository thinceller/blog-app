class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.update(user_id: current_user[:id])
    @article.save
    redirect_to root_url
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    # 編集後の処理
  end

  def show
    @article = Article.find(params[:id])
  end

  private

    def article_params
      params.require(:article).permit(:title, :body)
    end
end
