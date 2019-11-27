# frozen_string_literal: true

# UserModel
class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :validatable, :confirmable
  after_create :assign_default_role, :check_confirmation?
  has_many :posts
  has_many :comments
  acts_as_voter
  def assign_default_role
    add_role(:user) if roles.blank?
  end

  private

  def check_confirmation?
    if confirmed?
    end
  end
end
