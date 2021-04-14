class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: true
  validates :experience, presence: true
  validates :date, presence: true
  
  belongs_to :user

  mount_uploader :image, ImageUploader
end
