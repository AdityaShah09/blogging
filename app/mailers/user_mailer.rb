# frozen_string_literal: true

# UserMailer
class UserMailer < ApplicationMailer
  default from: 'adijain09031996@gmail.com'
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to My Blogs Website')
  end
end
