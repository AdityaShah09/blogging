# frozen_string_literal: true

# HomesController
class HomesController < ApplicationController
  def index
    @users = User.all
  end
end
