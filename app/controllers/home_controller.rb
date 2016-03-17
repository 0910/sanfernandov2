class HomeController < ApplicationController
  def index
  	@featured_news = News.where(status: 'published', featured: 'Yes').order(date: :desc).first(5)
  	@news = News.where(status: 'published').order(date: :desc).first(3)
  	@events = Event.all.order(date: :desc).first(3)
  	@banners = Banner.where(status: 'published')
  end
end
