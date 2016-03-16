ActiveAdmin.register Page do

  #permit_params :title, :project_type_id, :description, :benefit, :solved_problems, :image_attributes, :target_id, :category_id, :link, :city_id, :user_id

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  index do
    column :id
    column :name
    column :slug
    column :created_at
    column :updated_at
    actions
  end
  
  show do |p|
    attributes_table do
      row :name
      row :title
      row :description
    end
  end

  form html: { multipart: true } do |f|
    f.inputs 'Details' do
      f.semantic_errors
      f.input :name, :require => true
      f.input :title, :require => true
      f.input :description, :as => :ckeditor
    end
    f.actions
  end
end

