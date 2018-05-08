class Article < ApplicationRecord

  class << self

    def most_popular
      most_popular_ids = REDIS.zrevrange "articles/pv", 0, 2
      articles_ranking = most_popular_ids.map{ |id| Article.find(id) }
    end

    def get_pv(article_id)
      REDIS.zscore("articles/pv", article_id).to_i
    end
  end
end
