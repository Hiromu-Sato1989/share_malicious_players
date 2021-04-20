# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Votes', type: :system do
  describe '投票機能を使用する' do
    let!(:fighter) { create(:fighter, :daigo) }

    before do
      visit root_path
    end

    context '投票を行う' do
      it '投票が成功する' do
        click_link '悪質プレイヤー一覧'
        click_link fighter.name
        click_button 'やってきた'
        expect(page).to have_content('投票しました！')
      end

      it '投票が失敗する' do
        click_link '悪質プレイヤー一覧'
        click_link fighter.name
        click_button 'やってきた'
        click_button 'やってきた'
        expect(page).to have_content('すでに投票しています')
      end
    end
  end
end
