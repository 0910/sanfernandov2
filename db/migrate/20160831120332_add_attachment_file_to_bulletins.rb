class AddAttachmentFileToBulletins < ActiveRecord::Migration
  def self.up
    change_table :bulletins do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :bulletins, :file
  end
end
