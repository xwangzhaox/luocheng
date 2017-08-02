class ArticlesController < ApplicationController
  layout "category"

  def index
    @articles = Article.where(category_id: 2).paginate(:page => params[:page], :per_page => 10)

    page = params[:page].to_i > 0 ? params[:page].to_i : 1
    @collection = WillPaginate::Collection.new page, 10, @articles.size/10
  end

  def show
    @article = Article.where(en_title: params[:en_name]).first
  end
end
