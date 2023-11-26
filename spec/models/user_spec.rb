require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'すべての項目が適切に入力されれば登録ができる' do
      expect(@user).to be_valid 
    end

    it 'nicknameが空では登録できない' do
      @user.nickname = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include "ユーザーネームを入力してください"
    end
    it 'nicknameが11文字以上では登録できない' do
      @user.nickname = '12345678901' 
      @user.valid?
      expect(@user.errors.full_messages).to include "ユーザーネームは10文字以内で入力してください"
    end
    it 'nicknameが重複しては登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.nickname = @user.nickname
      another_user.valid?
      expect(another_user.errors.full_messages).to include "ユーザーネームはすでに存在します"
    end
    it '都道府県を選択しないと登録できない' do
      @user.prefecture_id = 1 
      @user.valid?
      expect(@user.errors.full_messages).to include "都道府県を選択してください"
    end
    it '育てる目的を選択しないと登録できない' do
      @user.purpose_id = 1 
      @user.valid?
      expect(@user.errors.full_messages).to include "育てる目的を選択してください"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Eメールを入力してください"
    end
    it 'emailが重複しては登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include "Eメールはすでに存在します"
    end
    it 'emailに@が含んでいなければ登録できない' do
      @user.email = 'ttttttttt'
      @user.valid?
      expect(@user.errors.full_messages).to include "Eメールは不正な値です"
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "パスワードを入力してください"
    end
    it 'passwordが6文字以下では登録できない' do
      @user.password = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include "パスワードは6文字以上で入力してください"
    end
    it 'パスワードは全角が含むと登録できない' do
      @user.password = '123アイウ'
      @user.valid?
      expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません"
    end
    it 'パスワードと確認用パスワードが一致しないと登録できない' do
      @user.password_confirmation = '1234rr'
      @user.valid?
      expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません"
    end
  end
end
