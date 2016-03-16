class HomeController < ApplicationController
  def index
  	@news = News.all
  	@events = Event.all
  	@banners = Banner.all
  end
end
