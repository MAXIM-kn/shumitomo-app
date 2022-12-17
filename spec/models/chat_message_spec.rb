require 'rails_helper'

RSpec.describe ChatMessage, type: :model do
  before do
    @chat_message = FactoryBot.build(:chat_message)
  end

  describe 'メッセージ投稿' do
    context 'メッセージが投稿できる場合' do
      it 'メッセージと画像が存在していれば保存できる' do
        expect(@chat_message).to be_valid
      end
      it 'メッセージが空でも保存できる' do
        @chat_message.content = ''
        expect(@chat_message).to be_valid
      end
      it '画像が空でも保存できる' do
        @chat_message.image = nil
        expect(@chat_message).to be_valid
      end
    end
    context 'メッセージが投稿できない場合' do
      it 'メッセージと画像が空では保存できない' do
        @chat_message.content = ''
        @chat_message.image = nil
        @chat_message.valid?
        expect(@chat_message.errors.full_messages).to include('メッセージを入力してください')
      end
      it 'roomが紐付いていないと保存できない' do
        @chat_message.chat_room = nil
        @chat_message.valid?
        expect(@chat_message.errors.full_messages).to include('チャットルームを入力してください')
      end
      it 'userが紐付いていないと保存できない' do
        @chat_message.user = nil
        @chat_message.valid?
        expect(@chat_message.errors.full_messages).to include('ユーザーを入力してください')
      end
    end
  end
end
