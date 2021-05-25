require 'rails_helper'

RSpec.describe "Users", type: :system do
  let(:user_equal_email) { create(:user, :equal_email) }
  describe 'ユーザー会員登録' do
    before do
      visit new_user_path
    end

    context '入力値が正常' do
      it '会員登録が成功する' do
        fill_in '名前', with: '名無し'
        fill_in 'メールアドレス', with: 'sample@example.com'
        fill_in 'パスワード', with: 'password'
        click_button '登録'
        expect(page).to have_content('会員登録しました')
        expect(page).to have_current_path login_path, ignore_query: true
      end
    end
    
    context '名前が未入力' do
      it '会員登録が失敗する' do
        fill_in '名前', with: ''
        fill_in 'メールアドレス', with: 'sample@example.com'
        fill_in 'パスワード', with: 'password'
        click_button '登録'
        expect(page).to have_content('登録できませんでした')
        expect(page).to have_content('名前を入力してください')
        expect(page).to have_content('名前は3文字以上で入力してください')
        expect(page).to have_current_path users_path, ignore_query: true
      end
    end

    context 'メールアドレスが未入力' do
      it '会員登録が失敗する' do
        fill_in '名前', with: '名無し'
        fill_in 'メールアドレス', with: ''
        fill_in 'パスワード', with: 'password'
        click_button '登録'
        expect(page).to have_content('登録できませんでした')
        expect(page).to have_content('メールアドレスを入力してください')
        expect(page).to have_content('メールアドレスの形式で入力してください')
        expect(page).to have_current_path users_path, ignore_query: true
      end
    end

    context 'パスワードが未入力' do
      it '会員登録が失敗する' do
        fill_in '名前', with: '名無し'
        fill_in 'メールアドレス', with: 'sample@example.com'
        fill_in 'パスワード', with: ''
        click_button '登録'
        expect(page).to have_content('登録できませんでした')
        expect(page).to have_content('パスワードを入力してください')
        expect(page).to have_content('パスワードは6文字以上で入力してください')
        expect(page).to have_current_path users_path, ignore_query: true
      end
    end

    context '名前が3文字未満' do
      it '会員登録が失敗する' do
        fill_in '名前', with: 'aa'
        fill_in 'メールアドレス', with: 'sample@example.com'
        fill_in 'パスワード', with: 'password'
        click_button '登録'
        expect(page).to have_content('登録できませんでした')
        expect(page).to have_content('名前は3文字以上で入力してください')
        expect(page).to have_current_path users_path, ignore_query: true
      end
    end

    context 'パスワードが6文字未満' do
      it '会員登録が失敗する' do
        fill_in '名前', with: '名無し'
        fill_in 'メールアドレス', with: 'sample@example.com'
        fill_in 'パスワード', with: 'aaaaa'
        click_button '登録'
        expect(page).to have_content('登録できませんでした')
        expect(page).to have_content('パスワードは6文字以上で入力してください')
        expect(page).to have_current_path users_path, ignore_query: true
      end
    end

    context '同一のメールアドレスを使用した会員が既に存在する' do
      it '会員登録が失敗する' do
        user_equal_email
        fill_in '名前', with: '名無し'
        fill_in 'メールアドレス', with: 'tokido@akuma.com'
        fill_in 'パスワード', with: 'password'
        click_button '登録'
        expect(page).to have_content('登録できませんでした')
        expect(page).to have_content('メールアドレスはすでに存在します')
        expect(page).to have_current_path users_path, ignore_query: true
      end
    end
  end
end
