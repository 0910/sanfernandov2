class AddDescriptionToBanners < ActiveRecord::Migration
  def change
    add_column :banners, :description, :text
  end
end
