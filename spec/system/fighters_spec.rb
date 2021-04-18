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
        fill_in "Fighter's ID", with: 'tokido77'
        select 'ブロンズ', from: 'fighter_league_id'
        check 'リュウ'
        check '屈伸'
        click_button '登録'
        expect(page).to have_content('悪質プレイヤーを登録しました')
        expect(page).to have_current_path root_path, ignore_query: true
      end
    end

    context '名前が未入力' do
      it '登録が失敗する' do
        select 'ブロンズ', from: 'fighter_league_id'
        check 'リュウ'
        check '屈伸'
        click_button '登録'
        expect(page).to have_content('登録できませんでした')
        expect(page).to have_current_path fighters_path, ignore_query: true
      end
    end

    context 'リーグIDが未入力' do
      it '登録が失敗する' do
        fill_in "Fighter's ID", with: 'tokido77'
        check 'リュウ'
        check '屈伸'
        click_button '登録'
        expect(page).to have_content('登録できませんでした')
        expect(page).to have_current_path fighters_path, ignore_query: true
      end
    end

    context '登録済みの名前を再度登録' do
      it '登録が失敗する' do
        fill_in "Fighter's ID", with: 'umehara'
        select 'ブロンズ', from: 'fighter_league_id'
        check 'リュウ'
        check '屈伸'
        click_button '登録'
        expect(page).to have_content('登録できませんでした')
        expect(page).to have_current_path fighters_path, ignore_query: true
      end
    end
  end

  describe '悪質プレイヤー検索' do
    before do
      create(:league, :silver)
      league_b = create(:league, :bronze)
      create(:fighter, :daigo, league: league_b)
      visit root_path
      click_link '検索'
    end

    context '頭文字検索' do
      it '検索でヒットする' do
        click_link 'U'
        expect(page).to have_content('umehara')
        expect(page).to have_current_path fighters_path, ignore_query: true
      end

      it '検索でヒットしない' do
        click_link 'A'
        expect(page).not_to have_content('umehara')
        expect(page).to have_current_path fighters_path, ignore_query: true
      end
    end

    context "Fighter's ID検索を使う" do
      it '検索でヒットする' do
        fill_in "Fighter's ID", with: 'ume'
        click_button '検索'
        expect(page).to have_content('umehara')
        expect(page).to have_current_path fighters_path, ignore_query: true
      end

      it '検索でヒットしない' do
        fill_in "Fighter's ID", with: 'name_1'
        click_button '検索'
        expect(page).not_to have_content('name_1')
        expect(page).to have_current_path fighters_path, ignore_query: true
      end
    end

    context 'リーグ検索を使う' do
      it '検索でヒットする' do
        select 'ブロンズ', from: 'q_league_id_eq'
        click_button '検索'
        expect(page).to have_content('umehara')
        expect(page).to have_current_path fighters_path, ignore_query: true
      end

      it '検索でヒットしない' do
        select 'シルバー', from: 'q_league_id_eq'
        click_button '検索'
        expect(page).not_to have_content('umehara')
        expect(page).to have_current_path fighters_path, ignore_query: true
      end
    end

    context 'キャラクター検索を使う' do
      it '検索でヒットする' do
        check 'character_31'
        click_button '検索'
        expect(page).to have_content('umehara')
        expect(page).to have_current_path fighters_path, ignore_query: true
      end

      it '検索でヒットしない' do
        check 'character_34'
        click_button '検索'
        expect(page).not_to have_content('tokido77')
        expect(page).to have_current_path fighters_path, ignore_query: true
      end
    end
  end
end
