# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Fighters', type: :system do
  let!(:category) { create(:category, :kusshin) }
  let!(:league_b) { create(:league, :bronze) }
  let!(:character) { create(:character, :ryu) }
  let(:fighter_d) { create(:fighter, :daigo, categories: [category], character: character, league: league_b) }
  let(:admin) { create(:user, :admin) }

  describe '管理者による悪質プレイヤーの新規登録' do
    before do
      login_as(admin)
      visit new_fighter_path
    end

    context '入力値が正常' do
      it '登録が成功する' do
        fill_in "Fighter's ID", with: 'tokido77'
        select 'ブロンズ', from: 'fighter_league_id'
        find('.fighter_categories').click
        click_button '登録'
        click_button 'OK'
        expect(page).to have_content('悪質プレイヤーを登録しました')
        fighter = Fighter.last
        expect(page).to have_current_path fighter_path(fighter), ignore_query: true
      end
    end

    context '名前が未入力' do
      it '登録が失敗する' do
        select 'ブロンズ', from: 'fighter_league_id'
        find('.fighter_categories').click
        click_button '登録'
        click_button 'OK'
        expect(page).to have_content('登録できませんでした')
        expect(page).to have_content("Fighter's IDを入力してください")
        expect(page).to have_content("Fighter's IDは6文字以上で入力してください")
        expect(page).to have_content("Fighter's IDは英字、数字、「 - 」、「 _ 」で入力してください")
        expect(page).to have_current_path fighters_path, ignore_query: true
      end
    end

    context 'リーグIDが未入力' do
      it '登録が失敗する' do
        fill_in "Fighter's ID", with: 'umehara'
        find('.fighter_categories').click
        click_button '登録'
        click_button 'OK'
        expect(page).to have_content('登録できませんでした')
        expect(page).to have_content('リーグを入力してください')
        expect(page).to have_current_path fighters_path, ignore_query: true
      end
    end

    context 'カテゴリーが未入力' do
      it '登録が失敗する' do
        fill_in "Fighter's ID", with: 'tokido77'
        select 'ブロンズ', from: 'fighter_league_id'
        click_button '登録'
        click_button 'OK'
        expect(page).to have_content('登録できませんでした')
        expect(page).to have_content('悪質プレイを選択してください')
        expect(page).to have_current_path fighters_path, ignore_query: true
      end
    end

    context '登録済みの名前を再度登録' do
      it '登録が失敗する' do
        fighter_d
        fill_in "Fighter's ID", with: 'umehara'
        select 'ブロンズ', from: 'fighter_league_id'
        find('.fighter_categories').click
        click_button '登録'
        click_button 'OK'
        expect(page).to have_content('登録できませんでした')
        expect(page).to have_content("Fighter's IDがすでに登録されています。検索してみてください")
        expect(page).to have_current_path fighters_path, ignore_query: true
      end
    end
  end

  describe '悪質プレイヤー検索' do
    before do
      fighter_d
      visit root_path
      click_link '検索', match: :first
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
        fill_in "Fighter's ID", with: 'umehara'
        click_button '検索'
        expect(page).to have_content('umehara')
        expect(page).to have_current_path fighters_path, ignore_query: true
      end

      it '検索でヒットしない' do
        fill_in "Fighter's ID", with: 'tokido77'
        click_button '検索'
        expect(page).not_to have_content('umehara')
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
        create(:league, :silver)
        select 'シルバー', from: 'q_league_id_eq'
        click_button '検索'
        expect(page).not_to have_content('umehara')
        expect(page).to have_current_path fighters_path, ignore_query: true
      end
    end

    context 'Category検索を使う' do
      it '検索でヒットする' do
        check '屈伸'
        click_button '検索'
        expect(page).to have_content('umehara')
        expect(page).to have_current_path fighters_path, ignore_query: true
      end

      it '検索でヒットしない' do
        check '屈伸'
        click_button '検索'
        expect(page).not_to have_content('tokido77')
        expect(page).to have_current_path fighters_path, ignore_query: true
      end
    end
  end

  describe '管理者による悪質プレイヤーの編集' do
    before do
      create(:character, :ken)
      create(:category, :namepu)
      login_as(admin)
      visit fighter_path(fighter_d)
      click_link '編集'
    end

    context 'キャラクター選択の編集' do
      it '編集に成功' do
        find('#accordion-character').click
        choose 'ケン'
        click_button '更新'
        expect(page).to have_content('プレイヤーデータを更新しました')
        expect(page).to have_current_path fighter_path(fighter_d), ignore_query: true
      end
    end

    context 'カテゴリーの編集' do
      it '編集に成功' do
        page.all('.fighter_categories')[1].click
        click_button '更新'
        expect(page).to have_content('プレイヤーデータを更新しました')
        expect(page).to have_current_path fighter_path(fighter_d), ignore_query: true
      end

      it '選択を0件にして編集に失敗' do
        page.all('.fighter_categories')[0].click
        click_button '更新'
        expect(page).to have_content('入力内容に誤りがあります')
        expect(page).to have_current_path fighter_path(fighter_d), ignore_query: true
      end
    end
  end

  describe '非管理者による新規登録や編集機能の使用' do
    context '悪質プレイヤーの新規登録' do
      it 'アクセス後トップ画面へリダイレクトする' do
        visit new_fighter_path
        expect(page).to have_content('管理者しか入れません')
        expect(page).to have_current_path root_path, ignore_query: true
      end
    end

    context '悪質プレイヤーの編集' do
      it 'アクセス後トップ画面へリダイレクトする' do
        visit edit_fighter_path(fighter_d)
        expect(page).to have_content('管理者しか入れません')
        expect(page).to have_current_path root_path, ignore_query: true
      end
    end
  end
end
