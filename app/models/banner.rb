class Banner < ActiveRecord::Base
	belongs_to :admin_user
	has_attached_file :image, :styles => { :thumb => "120x80>", :medium => '480x320>', :large => '720x480>' },
						:url  => "/assets/banners/:id/:style/:basename.:extension",
						:path => ":rails_root/public/assets/banners/:id/:style/:basename.:extension"
						
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
