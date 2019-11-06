# frozen_string_literal: true

# UserModel
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :validatable
  has_many :posts
  has_many :comments
  acts_as_voter
end
