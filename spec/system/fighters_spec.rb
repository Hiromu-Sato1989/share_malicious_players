# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Fighters', type: :system do
  describe '悪質プレイヤーの新規登録' do
    before do
      create(:fighter, :daigo)
      create(:league, :bronze)
      create(:league, :silver)
      create(:league, :gold)
      create(:category, :kusshin)
      create(:character, :ryu)
      visit root_path
      click_link '悪質プレイヤーを登録'
    end

    context '入力値が正常' do
      it '登録が成功する' do
        fill_in 'Name', with: 'tokido77'
        select 'ブロンズ', from: 'League'
        check 'リュウ'
        check '屈伸'
        click_button '登録'
        expect(page).to have_content('悪質プレイヤーを登録しました')
        expect(page).to have_current_path root_path, ignore_query: true
      end
    end

    context '名前が未入力' do
      it '登録が失敗する' do
        select 'ブロンズ', from: 'League'
        check 'リュウ'
        check '屈伸'
        click_button '登録'
        expect(page).to have_content('登録できませんでした')
        expect(page).to have_current_path fighters_path, ignore_query: true
      end
    end

    context 'リーグIDが未入力' do
      it '登録が失敗する' do
        fill_in 'Name', with: 'tokido77'
        check 'リュウ'
        check '屈伸'
        click_button '登録'
        expect(page).to have_content('登録できませんでした')
        expect(page).to have_current_path fighters_path, ignore_query: true
      end
    end

    context '登録済みの名前を再度登録' do
      it '登録が失敗する' do
        fill_in 'Name', with: 'umehara'
        select 'ブロンズ', from: 'League'
        check 'リュウ'
        check '屈伸'
        click_button '登録'
        expect(page).to have_content('登録できませんでした')
        expect(page).to have_current_path fighters_path, ignore_query: true
      end
    end
  end
end
