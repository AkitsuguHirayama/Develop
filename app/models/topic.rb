class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: true
  validates :experience, presence: true
end
