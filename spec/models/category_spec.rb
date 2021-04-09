# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'カテゴリーを新規登録する' do
    it 'カテゴリー1件登録が成功する' do
      category = create(:category)
      expect(category).to be_valid
      expect(category.errors).to be_empty
    end

    it '別名のカテゴリー2件登録が成功する' do
      category = create(:category)
      category_another_name = create(:category)
      expect(category).to be_valid
      expect(category.errors).to be_empty
      expect(category_another_name).to be_valid
      expect(category_another_name.errors).to be_empty
    end

    it '同名のカテゴリー2件登録が失敗する' do
      category = create(:category, name: 'name')
      category_equal_name = build(:category, name: 'name')
      expect(category).to be_valid
      expect(category.errors).to be_empty
      expect(category_equal_name).to be_invalid
      expect(category_equal_name.valid?).to eq(false)
    end
  end
end
