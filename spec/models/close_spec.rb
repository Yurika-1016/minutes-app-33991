require 'rails_helper'

RSpec.describe Close, type: :model do
  describe 'close登録' do
    let(:minute) { create(:minute) }
    before { @close = create(:close, minute: minute) }

    it 'minute_idがあればclose登録できる' do
      expect(@close).to be_valid
    end

    it 'minute_idがないと登録できない' do
      @close.minute_id = nil
      @close.valid?
      expect(@close.errors.full_messages).to include('Minute must exist')
    end

    it 'minute_idが既に登録済みだとclose登録できない' do
      @close.save
      another_close = build(:close, minute: minute)
      another_close.valid?
      expect(another_close.errors.full_messages).to include('Minute has already been taken')
    end
  end
end
