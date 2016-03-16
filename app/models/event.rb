class Event < ActiveRecord::Base
  belongs_to :admin_user

  has_many :images, :dependent => :destroy
  accepts_nested_attributes_for :images, :allow_destroy => true
  
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :subtitle, presence: true
  validates :info, presence: true

  extend FriendlyId
  friendly_id :title, use: :slugged
end
