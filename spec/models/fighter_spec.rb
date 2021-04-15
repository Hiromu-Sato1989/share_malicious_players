# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Fighter, type: :model do
  describe 'ファイターの新規登録をする' do
    let(:fighter) { create(:fighter) }
    let(:fighter_no_name) { build(:fighter, name: "") }
    let(:fighter_no_league) { build(:fighter, league_id: "") }
    let(:fighter_equal_name) { build(:fighter, name: "name_1") }
    it '名前、リーグIDがある場合、有効である' do
      expect(fighter).to be_valid
      expect(fighter.errors).to be_empty
    end
    it '名前がない場合、無効である' do
      expect(fighter_no_name).to be_invalid
      expect(fighter_no_name.valid?).to eq(false)
    end
    it 'リーグIDがない場合、無効である' do
      expect(fighter_no_league).to be_invalid
      expect(fighter_no_league.valid?).to eq(false)
    end
    it '名前が重複した場合、無効である' do
      expect(fighter_equal_name).to be_invalid
      expect(fighter_equal_name.valid?).to eq(false)
    end
  end
end
