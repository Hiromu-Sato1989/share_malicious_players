# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'UserSessions', type: :system do
  let(:user) { create(:user) }

  describe 'ユーザーログイン' do
    before do
      visit login_path
    end

    context '入力値が正常' do
      it 'ログイン成功' do
        fill_in 'メールアドレス', with: user.email
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'
        expect(page).to have_content('ログインしました')
        expect(page).to have_current_path root_path
      end
    end

    context 'メールアドレスが未入力' do
      it 'ログイン失敗' do
        fill_in 'メールアドレス', with: ''
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'
        expect(page).to have_content('メールアドレスまたはパスワードが間違っています')
        expect(page).to have_current_path login_path
      end
    end

    context 'パスワードが未入力' do
      it 'ログイン失敗' do
        fill_in 'メールアドレス', with: user.email
        fill_in 'パスワード', with: ''
        click_button 'ログイン'
        expect(page).to have_content('メールアドレスまたはパスワードが間違っています')
        expect(page).to have_current_path login_path
      end
    end

    context '不正な値' do
      it 'ログイン失敗' do
        fill_in 'メールアドレス', with: 'tokido@akuma.com'
        fill_in 'パスワード', with: 'abcdefg'
        click_button 'ログイン'
        expect(page).to have_content('メールアドレスまたはパスワードが間違っています')
        expect(page).to have_current_path login_path
      end
    end
  end
end
