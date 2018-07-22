class Restaurant < ApplicationRecord
  mount_uploader :image, PhotoUploader
  validates_presence_of :name, :tel, :address, :opening_hours, :description
  belongs_to :category, optional: true
end
