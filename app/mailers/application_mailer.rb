# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: ENV['ADMIN_MAIL_ADDRESS']
  layout 'mailer'
end
