ActiveAdmin.register Balance do

  #permit_params :title, :project_type_id, :description, :benefit, :solved_problems, :image_attributes, :target_id, :category_id, :link, :city_id, :user_id

  before_create do |balance|
    balance.admin_user = current_admin_user
  end

  index do
    column :id
    column :date
    column :name
    column :admin_user
    column 'Status', :sortable => :status do |resource|
      column_select(resource, :status, ["published", "Pending", "Suspended"])
    end
    actions
  end
  
  show do |p|
    attributes_table do
      row :date
      row :name
      row :file do
      	content_tag(:span, balance.file.path)
      end
    end
  end

  form html: { multipart: true } do |f|
    f.inputs 'Details' do
      f.semantic_errors
      f.input :date, as: :datepicker
      f.input :name, :require => true
      f.input :status, as: :select2, :collection => ['Published', 'Pending', 'Suspended'], :include_blank => false
    end
    f.inputs "PDF File" do
      f.input :file, :as => :file, label: 'File', hint: f.object.new_record? ? f.template.content_tag(:span, "No File Yet") : image_tag(f.object.file.url(:thumb))
    end
    f.actions
  end
end
