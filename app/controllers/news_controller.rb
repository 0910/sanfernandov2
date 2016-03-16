class NewsController < ApplicationController
  def index
  	@news = Kaminari.paginate_array(News.order("date DESC").where("status = ?", 'published').all).page(params[:page]).per(12)
  end

  def show
  	@news = News.friendly.find(params[:id])
  	@banners = Banner.all
  end
end
