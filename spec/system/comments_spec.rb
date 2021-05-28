# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Comments', type: :system do
  let!(:category) { create(:category, :kusshin) }
  let!(:league_b) { create(:league, :bronze) }
  let!(:character) { create(:character, :ryu) }
  let(:fighter_d) { create(:fighter, :daigo, categories: [category], character: character, league: league_b) }
  let(:user) { create(:user) }

  describe 'コメント機能' do
    before do
      visit login_path
      fill_in 'メールアドレス', with: user.email
      fill_in 'パスワード', with: 'password'
      click_button 'ログイン'
      visit fighter_path(fighter_d)
    end

    context '入力値が正常' do
      it 'コメントが成功する' do
        fill_in 'コメント', with: 'テスト'
        click_button '投稿する'
        click_button 'OK'
        expect(page).to have_content('コメントを投稿しました')
        expect(page).to have_content('テスト')
        expect(page).to have_content(user.name)
        expect(page).to have_current_path fighter_path(fighter_d), ignore_query: true
      end
    end

    context '入力値が不正' do
      it 'コメントが失敗する' do
        fill_in 'コメント', with: ''
        click_button '投稿する'
        click_button 'OK'
        expect(page).to have_content('コメントを入力してください')
        expect(page).to have_current_path fighter_path(fighter_d), ignore_query: true
      end
    end

    context '自分が投稿したコメント' do
      it 'コメントを削除できる' do
        fill_in 'コメント', with: 'テスト'
        click_button '投稿する'
        click_button 'OK'
        find('.cross').click
        click_button 'OK'
        expect(page).to have_content('コメントを削除しました')
        expect(page).not_to have_content('テスト')
        expect(page).not_to have_content(user.name)
        expect(page).to have_current_path fighter_path(fighter_d), ignore_query: true
      end
    end
  end
end
