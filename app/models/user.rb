# frozen_string_literal: true

# UserModel
class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :validatable, :confirmable
  after_create :assign_default_role
  has_many :posts, dependent: :destroy
  has_many :comments
  has_many :visitors
  acts_as_voter
  def assign_default_role
    add_role(:user) if roles.blank?
  end
end
