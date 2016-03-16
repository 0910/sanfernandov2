class AddStatusToBalances < ActiveRecord::Migration
  def change
    add_column :balances, :status, :string
  end
end
