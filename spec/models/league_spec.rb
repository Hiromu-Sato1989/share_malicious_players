# frozen_string_literal: true

require 'rails_helper'

RSpec.describe League, type: :model do
  describe 'リーグを新規登録する' do
    it 'リーグが1件登録できる' do
      league = create(:league)
      expect(league).to be_valid
      expect(league.errors).to be_empty
    end

    it '別名のリーグが2件登録できる' do
      league = create(:league)
      league_another_name = create(:league)
      expect(league).to be_valid
      expect(league.errors).to be_empty
      expect(league_another_name).to be_valid
      expect(league_another_name.errors).to be_empty
    end

    it '同名のリーグが2件登録できない' do
      league = create(:league, name: 'name')
      league_equal_name = build(:league, name: 'name')
      expect(league).to be_valid
      expect(league.errors).to be_empty
      expect(league_equal_name).to be_invalid
      expect(league_equal_name.valid?).to eq(false)
    end
  end
end
