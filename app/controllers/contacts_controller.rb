# frozen_string_literal: true

class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.send_mail(@contact).deliver_now
      flash[:success] = '送信完了しました。お問い合わせありがとうございます'
      redirect_to root_path
    else
      flash.now[:danger] = 'お問い合わせ内容を入力してください'
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:message)
  end
end
