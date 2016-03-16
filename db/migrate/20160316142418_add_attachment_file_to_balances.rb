class AddAttachmentFileToBalances < ActiveRecord::Migration
  def self.up
    change_table :balances do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :balances, :file
  end
end
