# frozen_string_literal: true.

class Visitor < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def self.saveVisitor(user, post)
    @visitor = post.visitors.new(user_id: user.id, visited_at: Date.today)
    if check_visited(user,post)
      @visitor.save
    else
    end
  end

  def self.check_visited(user, post)
    # visitor = Visitor.where(user_id: user.id, post_id: post.id)
    # if visitor.created_at == Date.today
    # count = visitor.count + 1
    #  visitor.update(count: count)
    #  return false
    # else
    #  return true
    # end
  end
end
