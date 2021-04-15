require 'rails_helper'

RSpec.describe "Fighters", type: :system do
  describe '悪質プレイヤーの新規登録' do
    let!(:fighter_d) { create(:fighter, :daigo) }
    let!(:league_b) { create(:league, :bronze) }
    let!(:league_s) { create(:league, :silver) }
    let!(:league_g) { create(:league, :gold) }
    let!(:category_k) { create(:category, :kusshin) }
    let!(:character_r) { create(:character, :ryu) }
    before do
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
        expect(current_path).to eq root_path
      end
    end
    context '名前が未入力' do
      it '登録が失敗する' do
        select 'ブロンズ', from: 'League'
        check 'リュウ'
        check '屈伸'
        click_button '登録'
        expect(page).to have_content('登録できませんでした')
        expect(current_path).to eq fighters_path
      end
    end
    context 'リーグIDが未入力' do
      it '登録が失敗する' do
        fill_in 'Name', with: 'tokido77'
        check 'リュウ'
        check '屈伸'
        click_button '登録'
        expect(page).to have_content('登録できませんでした')
        expect(current_path).to eq fighters_path
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
        expect(current_path).to eq fighters_path
      end
    end
  end
end
