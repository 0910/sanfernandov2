class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.string :subtitle
      t.date :date
      t.text :info
      t.string :status
      t.string :video
      t.references :admin_user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
