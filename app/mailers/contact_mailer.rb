# frozen_string_literal: true

class ContactMailer < ApplicationMailer
  def send_mail(contact)
    @contact = contact
    mail(
      to: @contact.email,
      subject: '【お問い合わせ・フィードバック】'
    )
  end
end
