# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Votes', type: :system do
  describe '投票機能を使用する' do
    let!(:category) { create(:category) }
    let!(:fighter) { create(:fighter, :daigo, categories: [category]) }

    before do
      visit fighter_path(fighter)
    end

    context '投票を行う' do
      it '投票が成功する' do
        click_link 'Guilty?'
        expect(page).to have_content('Guilty!')
      end

      it '2度目の投票ができない' do
        click_link 'Guilty?'
        expect(page).not_to have_content('Guilty?')
      end
    end
  end
end
