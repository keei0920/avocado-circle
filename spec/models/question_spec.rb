require 'rails_helper'

RSpec.describe Question, type: :model do
  before do
    @question = FactoryBot.build(:question)
  end

  describe '質問の投稿ができる' do
    it '必要な情報が適切に入力されれば投稿ができる' do
      expect(@question).to be_valid
    end
    it '画像が空欄でもテキストがあれば投稿ができる' do
      @question.image = nil
      expect(@question).to be_valid
    end
  end

  describe '質問の投稿ができない' do
    it 'タイトルの入力がないと投稿できない' do
      @question.title = nil
      @question.valid?
      expect(@question.errors.full_messages).to include "タイトルを入力してください"
    end
    it 'テキストの入力がないと投稿できない' do
      @question.text = nil
      @question.valid?
      expect(@question.errors.full_messages).to include "テキストを入力してください"
    end
    it 'userが紐づいていないと投稿できない' do
      @question.user = nil
      @question.valid?
      binding.pry
      expect(@question.errors.full_messages).to include "Userを入力してください"
    end
  end
end
