require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '記録の投稿ができる' do
    it '必要な情報が適切に入力されれば投稿ができる' do
      expect(@post).to be_valid
    end
    it 'テキストが空欄でも画像があれば投稿ができる' do
      @post.text = nil
      expect(@post).to be_valid
    end
    it '画像が空欄でもテキストがあれば投稿ができる' do
      @post.image = nil
      expect(@post).to be_valid
    end
  end

  describe '記録の投稿ができない' do
    it '記録日の入力がないと投稿できない' do
      @post.date = nil
      @post.valid?
      expect(@post.errors.full_messages).to include '日付を入力してください'
    end
    it '状態の入力がないと投稿できない' do
      @post.condition_id = 1
      @post.valid?
      expect(@post.errors.full_messages).to include '状態を選択してください'
    end
    it 'テキストと画像が両方ともないと投稿できない' do
      @post.text = nil
      @post.image = nil
      @post.valid?
      expect(@post.errors.full_messages).to include 'Textを入力してください'
    end
    it 'userが紐づいていないと投稿できない' do
      @post.user = nil
      @post.valid?
      expect(@post.errors.full_messages).to include 'Userを入力してください'
    end
  end
end
