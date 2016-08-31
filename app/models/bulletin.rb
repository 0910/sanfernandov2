class Bulletin < ActiveRecord::Base
  belongs_to :admin_user

	has_attached_file :file, :url  => "/assets/bulletins/:id/:basename.:extension", :path => ":rails_root/public/assets/bulletins/:id/:basename.:extension"
						
	validates_attachment :file, :content_type => { :content_type => "application/pdf" }
end
