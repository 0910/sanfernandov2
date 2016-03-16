class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :name
      t.string :link
      t.references :admin_user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
