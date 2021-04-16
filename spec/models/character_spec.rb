# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Character, type: :model do
  describe 'キャラクターを新規登録する' do
    it 'キャラクター1件登録が成功する' do
      character = create(:character)
      expect(character).to be_valid
      expect(character.errors).to be_empty
    end

    it '別名のキャラクター2件登録が成功する' do
      character = create(:character)
      character_another_name = create(:character)
      expect(character).to be_valid
      expect(character.errors).to be_empty
      expect(character_another_name).to be_valid
      expect(character_another_name.errors).to be_empty
    end

    it '同名のキャラクター2件登録が失敗する' do
      character = create(:character, name: 'name')
      character_equal_name = build(:character, name: 'name')
      expect(character).to be_valid
      expect(character.errors).to be_empty
      expect(character_equal_name).to be_invalid
      expect(character_equal_name.valid?).to eq(false)
    end
  end
end
