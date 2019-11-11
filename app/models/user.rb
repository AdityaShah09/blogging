# frozen_string_literal: true

# UserModel
class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :validatable
  after_create :assign_default_role
  
  has_many :posts
  has_many :comments
  acts_as_voter
  
  def assign_default_role
    self.add_role(:user) if self.roles.blank?
  end
end
