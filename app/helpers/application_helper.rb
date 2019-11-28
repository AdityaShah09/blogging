# frozen_string_literal: true

# ApplicatonHelper
module ApplicationHelper
  def current_role(user)
    user.roles.map(&:name)
  end
end
