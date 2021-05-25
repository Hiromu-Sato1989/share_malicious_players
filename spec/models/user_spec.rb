# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  describe '会員登録をする' do
    it '名前、メールアドレス、パスワードがある場合有効である' do
      user
      expect(user).to be_valid
      expect(user.errors).to be_empty
    end
    it '名前がない場合無効である' do
      user_no_name = build(:user, name: '')
      expect(user_no_name).to be_invalid
      expect(user_no_name.valid?).to eq(false)
    end
    it 'メールアドレスがない場合無効である' do
      user_no_email = build(:user, email: '')
      expect(user_no_email).to be_invalid
      expect(user_no_email.valid?).to eq(false)
    end
    it 'パスワードがない場合無効である' do
      user_no_password = build(:user, password: '')
      expect(user_no_password).to be_invalid
      expect(user_no_password.valid?).to eq(false)
    end
    it '名前が3文字未満である場合無効である' do
      user_name_less_than_3_words = build(:user, name: 'aa')
      expect(user_name_less_than_3_words).to be_invalid
      expect(user_name_less_than_3_words.valid?).to eq(false)
    end
    it 'パスワードが6文字未満の場合無効である' do
      user_password_less_than_6_words = build(:user, password: 'aaaaa')
      expect(user_password_less_than_6_words).to be_invalid
      expect(user_password_less_than_6_words.valid?).to eq(false)
    end
    it 'メールアドレスが同一の場合無効' do
      create(:user, email: "sample_1@example.com")
      user_equal_email = build(:user, email: "sample_1@example.com")
      expect(user_equal_email).to be_invalid
      expect(user_equal_email.valid?).to eq(false)
    end
  end
end
