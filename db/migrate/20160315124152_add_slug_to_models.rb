class AddSlugToModels < ActiveRecord::Migration
  def change
  	add_column :news, :slug, :string
  	add_column :events, :slug, :string
  end
end
