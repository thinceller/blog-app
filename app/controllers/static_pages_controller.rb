class StaticPagesController < ApplicationController
  before_action :authenticate_user!, only: :authentication

  def home
    @articles = Article.all
  end

  def authentication
  end
end
