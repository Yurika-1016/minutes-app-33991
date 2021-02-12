require 'rails_helper'

RSpec.describe Pin, type: :model do
  describe 'ピンの登録' do
    # before do
    # @pin = FactoryBot.build(:pin)
    # end
    let(:user) { create(:user) }
    let(:minute) { create(:minute) }
    before { @pin = create(:pin, user: user, minute: minute) }

    it 'user_id, minute_idがあればpin登録できる' do
      expect(@pin).to be_valid
    end

    it 'user_idがないと登録できない' do
      @pin.user_id = nil
      @pin.valid?
      expect(@pin.errors.full_messages).to include('User must exist')
    end

    it 'minute_idがないと登録できない' do
      @pin.minute_id = nil
      @pin.valid?
      expect(@pin.errors.full_messages).to include('Minute must exist')
    end

    it 'user_id, minute_idが既に登録済みだと登録できない' do
      @pin.save
      another_pin = build(:pin, user: user, minute: minute)
      another_pin.valid?
      expect(another_pin.errors.full_messages).to include('User has already been taken')
    end
  end
end
