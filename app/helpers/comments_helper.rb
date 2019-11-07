# frozen_string_literal: true

module CommentsHelper
  def comment_user?(user)
    current_user.id == user
  end
end
