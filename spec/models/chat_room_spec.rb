require 'rails_helper'

RSpec.describe ChatRoom, type: :model do
  before do
    category = FactoryBot.create(:category)
    @chat_room = FactoryBot.build(:chat_room, category_id: category.id)
  end

  describe 'チャットルーム投稿機能' do
    context 'チャットルームが投稿できるとき' do
      it '必須入力の値がすべて正しく入力されていれば投稿できる' do
        expect(@chat_room).to be_valid
      end
      it 'ルーム画像がなくても投稿できる' do
        @chat_room.image = nil
        expect(@chat_room).to be_valid
      end
    end
    context 'チャットルームが投稿できない場合' do
      it 'ルーム名が空では投稿できない' do
        @chat_room.name = ''
        @chat_room.valid?
        expect(@chat_room.errors.full_messages).to include '名前を入力してください'
      end
      it 'ルーム紹介文が空では投稿できない' do
        @chat_room.introduction = ""
        @chat_room.valid?
        expect(@chat_room.errors.full_messages).to include 'ルーム紹介を入力してください'
      end
      it 'カテゴリーが空では投稿できない' do
        @chat_room.genre_id = ""
        @chat_room.valid?
        expect(@chat_room.errors.full_messages).to include 'カテゴリーが選択されていません'
      end
      it 'userが紐付いていなければ投稿できない' do
        @chat_room.owner_id = ""
        @chat_room.valid?
        expect(@chat_room.errors.full_messages).to include 'ユーザーが不正です'
      end
      it 'categoryが紐付いていなければ投稿できない' do
        @chat_room.category = nil
        @chat_room.valid?
        expect(@chat_room.errors.full_messages).to include 'カテゴリーを入力してください'
      end
    end
  end
end
