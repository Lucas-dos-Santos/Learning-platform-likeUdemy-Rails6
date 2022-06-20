class Course < ApplicationRecord
	validates :title, :short_description, :language, :level, :price, presence: true
	validates :description, presence: true

	extend FriendlyId
  friendly_id :title, use: :slugged

	belongs_to :user

	enum language: [:english, :polish, :russian, :portuguese]
	enum level: [:beginner, :intermediate, :advanced]
end
