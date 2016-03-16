ActiveAdmin.register Banner do

  #permit_params :title, :project_type_id, :description, :benefit, :solved_problems, :image_attributes, :target_id, :category_id, :link, :city_id, :user_id

  before_create do |banner|
    banner.admin_user = current_admin_user
  end

  index do
    column :id
    column :name
    column :link
    column :admin_user
    column 'Status', :sortable => :status do |resource|
      column_select(resource, :status, ["published", "Pending", "Suspended"])
    end
    actions
  end
  
  show do |p|
    attributes_table do
      row :name
      row :description
      row :link
      row :admin_user
      row :status
      row :image do
      	image_tag(banner.image.url(:thumb))
      end
    end
  end

  form html: { multipart: true } do |f|
    f.inputs 'Details' do
      f.semantic_errors
      f.input :name, :require => true
      f.input :description
      f.input :link
      f.input :status, as: :select2, :collection => ['Published', 'Pending', 'Suspended'], :include_blank => false
    end
    f.inputs "Artist Image" do
      f.input :image, :as => :file, label: 'Image', hint: f.object.new_record? ? f.template.content_tag(:span, "No Image Yet") : image_tag(f.object.image.url(:thumb))
    end
    f.actions
  end
end
