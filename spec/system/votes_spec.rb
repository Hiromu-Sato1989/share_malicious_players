require 'rails_helper'

RSpec.describe "Votes", type: :system do
  describe '投票機能を使用する' do
    before do
      create(:fighter)
      visit root_path
    end
    context '投票を行う' do
      it '投票が成功する' do
        click_link '悪質プレイヤー一覧'
        click_link 'name_1'
        click_button 'やってきた'
        expect(page).to have_content('投票しました！')
      end
      it '投票が失敗する' do
        click_link '悪質プレイヤー一覧'
        click_link 'name_2'
        click_button 'やってきた'
        click_button 'やってきた'
        expect(page).to have_content('すでに投票しています')
      end
    end
  end
end
