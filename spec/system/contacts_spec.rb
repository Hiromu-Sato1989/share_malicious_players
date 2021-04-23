# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Contacts', type: :system do
  describe 'お問い合わせ機能を使用する' do
    before do
      visit new_contact_path
    end

    context 'お問い合わせを送る' do
      it 'お問い合わせを書いて送信' do
        fill_in 'お問い合わせ内容', with: 'お問い合わせ'
        page.accept_confirm do
          click_on '送信する'
        end
        expect(page).to have_content('送信完了しました。お問い合わせありがとうございます。')
        expect(page).to have_current_path root_path
      end

      it 'お問い合わせを空のまま送信' do
        fill_in 'お問い合わせ内容', with: ''
        page.accept_confirm do
          click_on '送信する'
        end
        expect(page).to have_content('お問い合わせ内容を入力してください。')
        expect(page).to have_current_path contacts_path
      end
    end
  end
end
