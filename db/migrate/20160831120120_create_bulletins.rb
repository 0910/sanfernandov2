class CreateBulletins < ActiveRecord::Migration
  def change
    create_table :bulletins do |t|
      t.date :date
      t.string :name
      t.references :admin_user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
