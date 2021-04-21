# frozen_string_literal: true

class ContactMailer < ApplicationMailer
  def send_mail(contact)
    @contact = contact
    mail to: 'from@example.com', subject: '【ユーザーからのお問い合わせ】'
  end
end
