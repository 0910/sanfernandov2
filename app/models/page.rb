class Page < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :name, presence: true
  validates :name, uniqueness: true

  extend FriendlyId
  friendly_id :name, use: :slugged
end
