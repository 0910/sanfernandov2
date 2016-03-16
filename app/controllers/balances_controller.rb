class BalancesController < ApplicationController
  def index
  	@balances = Balance.where("status = ?", 'published')
  end
end
