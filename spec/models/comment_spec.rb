require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'コメント投稿機能' do
    before do
      @comment = FactoryBot.build(:comment)
    end

    it 'コメントが正しく入力されていれば投稿できる' do
      expect(@comment).to be_valid
    end

    it 'コメントが空欄の場合投稿できない' do
      @comment.title = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include("Title can't be blank")
    end
  end
end
