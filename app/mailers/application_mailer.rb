# frozen_string_literal: true

# ApplicationMailer
class ApplicationMailer < ActionMailer::Base
  default from: 'admin@yopmail.com'
  layout 'mailer'
end
