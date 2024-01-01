require 'rails_helper'

RSpec.describe Avocado, type: :model do
  before do
    @avocado = FactoryBot.build(:avocado)
  end

  describe 'アボカドの登録ができる' do
    it '必要な情報が適切に入力されれば登録ができる' do
      expect(@avocado).to be_valid
    end
  end

  describe 'アボカドの登録ができない' do
    it '名前の入力がないと登録できない' do
      @avocado.name = nil
      @avocado.valid?
      expect(@avocado.errors.full_messages).to include '名前を入力してください'
    end
    it 'userが紐づいていないと投稿できない' do
      @avocado.user = nil
      @avocado.valid?
      expect(@avocado.errors.full_messages).to include 'Userを入力してください'
    end
  end
end
