ActiveAdmin.register News do

  #permit_params :title, :project_type_id, :description, :benefit, :solved_problems, :image_attributes, :target_id, :category_id, :link, :city_id, :user_id
  
  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  before_create do |news|
    news.admin_user = current_admin_user
  end

  index do
    column :id
    column :date
    column :title
    column :category
    column :admin_user
    column 'Status', :sortable => :status do |resource|
      column_select(resource, :status, ["published", "Pending", "Suspended"])
    end
    actions
  end
  
  show do |p|
    attributes_table do
      row :date
      row :title
      row :subtitle
      row :info
      row :video
      row :admin_user
      row :status
      p.images.each do |image|
        row :image do
          image_tag(image.file.url(:thumb))
        end
      end
    end
  end

  form html: { multipart: true } do |f|
    f.inputs 'Details' do
      f.semantic_errors
      f.input :date, as: :datepicker
      f.input :title, :require => true
      f.input :subtitle, :require => true
      f.input :info, :require => true
      f.input :status, as: :select2, :collection => ['Published', 'Pending', 'Suspended'], :include_blank => false
      f.input :category_id, :as => :select2, :collection => Category.all, :include_blank => false, :require => true      
      f.input :video
    end
    f.inputs "Images" do
      f.has_many :images do |i|
        i.input :file, as: :file, label: false, hint: i.object.new_record? ? i.template.content_tag(:span, "No Image Yet") : image_tag(i.object.file.url(:thumb))
        i.input :cover, as: :boolean, label: "Cover"
        i.input :_destroy, as: :boolean, label: "Destroy?" unless i.object.new_record?
      end 
    end
    f.actions
  end
end
