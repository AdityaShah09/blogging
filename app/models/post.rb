# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :visitors
  has_many :comments, dependent: :destroy
  acts_as_votable
end
