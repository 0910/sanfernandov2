class BulletinsController < ApplicationController
  def index
  	@bulletins = Bulletin.all
  end
end
