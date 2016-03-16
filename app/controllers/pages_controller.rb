class PagesController < ApplicationController
  def show
  	@page = Page.friendly.find(params[:id])
  	@banners = Banner.all
  end
end
