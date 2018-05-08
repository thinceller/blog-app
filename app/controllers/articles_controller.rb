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
    @article = Article.find(params[:id])
    if @article.update_attributes(article_params)
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def show
    @article = Article.find(params[:id])
    REDIS.zincrby "articles/pv", 1, @article.id
    # REDISからデータを取り出す
  end

  def destroy
    Article.find(params[:id]).destroy
    redirect_to root_url
  end

  private

    def article_params
      params.require(:article).permit(:title, :body)
    end
end
