# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Fighter, type: :model do
  describe 'ファイターの新規登録をする' do
    let!(:category) { create(:category) }
    let(:fighter) { create(:fighter, :daigo, categories: [category]) }
    let(:fighter_no_name) { build(:fighter, categories: [category], name: '') }
    let(:fighter_no_league) { build(:fighter, categories: [category], league_id: '') }
    let(:fighter_equal_name) { build(:fighter, :daigo, categories: [category]) }
    let(:fighter_no_category) { build(:fighter) }

    it '名前、リーグ、カテゴリーがある場合、有効である' do
      expect(fighter).to be_valid
      expect(fighter.errors).to be_empty
    end

    it '名前がない場合、無効である' do
      expect(fighter_no_name).to be_invalid
      expect(fighter_no_name.valid?).to eq(false)
    end

    it 'リーグがない場合、無効である' do
      expect(fighter_no_league).to be_invalid
      expect(fighter_no_league.valid?).to eq(false)
    end

    it '名前が重複した場合、無効である' do
      fighter
      expect(fighter_equal_name).to be_invalid
      expect(fighter_equal_name.valid?).to eq(false)
    end

    it 'カテゴリーがない場合、無効である' do
      expect(fighter_no_category).to be_invalid
      expect(fighter_no_category.valid?).to eq(false)
    end
  end
end
