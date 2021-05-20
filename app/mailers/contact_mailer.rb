# frozen_string_literal: true

class ContactMailer < ApplicationMailer
  def send_mail(contact)
    @contact = contact
    mail to: ENV['ADMIN_MAIL_ADDRESS'], subject: '【ユーザーからのお問い合わせ】'
  end
end
