class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable
  after_create :assign_default_role
  has_many :courses
  rolify

  def assign_default_role
    self.add_role(:student) if self.roles.blank?
  end 
end
