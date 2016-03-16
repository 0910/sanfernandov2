class EventsController < ApplicationController
  def index
  	@events = Kaminari.paginate_array(Event.order("date DESC").where("status = ?", 'published').all).page(params[:page]).per(12)
  end

  def show
  	@event = Event.friendly.find(params[:id])
  	@banners = Banner.all
  end
end
