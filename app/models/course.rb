class Course < ApplicationRecord
	validates :title, presence: true
	validates :description, presence: true, length: { minimum: 5 }

	extend FriendlyId
  friendly_id :title, use: :slugged

	belongs_to :user
end
