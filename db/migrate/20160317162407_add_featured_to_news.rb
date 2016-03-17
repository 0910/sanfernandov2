class AddFeaturedToNews < ActiveRecord::Migration
  def change
    add_column :news, :featured, :string
  end
end
