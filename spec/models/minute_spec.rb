require 'rails_helper'

RSpec.describe Minute, type: :model do
  describe '新規議事録登録ができる場合' do
    before do
      @minute=FactoryBot.build(:minute)
      @minute.images = fixture_file_upload('public/images/test_image.png')
    end

    context '新規投稿ができる場合' do
      it '全ての項目を適切に埋めれば登録できる'do
      expect(@minute).to be_valid
      end
      it '画像が空でも登録できる'do
      @minute.images=nil
      expect(@minute).to be_valid
      end
    end

    context '新規投稿ができない場合' do
      it 'titleが空では登録できない'do
      @minute.title=nil
      @minute.valid?
      expect(@minute.errors.full_messages).to include("Title can't be blank")
      end
      it 'project_nameが空では登録できない'do
      @minute.project_name=nil
      @minute.valid?
      expect(@minute.errors.full_messages).to include("Project name can't be blank")
      end
      it 'participate_memberが空では登録できない'do
      @minute.participate_member=nil
      @minute.valid?
      expect(@minute.errors.full_messages).to include("Participate member can't be blank")
      end
      it 'meeting_dateが空では登録できない'do
      @minute.meeting_date=nil
      @minute.valid?
      expect(@minute.errors.full_messages).to include("Meeting date can't be blank")
      end
      it 'meeting_dateに"/"がないとは登録できない'do
      @minute.meeting_date="20001010"
      @minute.valid?
      expect(@minute.errors.full_messages).to include("Meeting date is invalid")
      end
      it 'meeting_dateのyear部分が3桁以下では登録できない'do
      @minute.meeting_date="200/10/10"
      @minute.valid?
      expect(@minute.errors.full_messages).to include("Meeting date is invalid")
      end
      it 'meeting_dateのyear部分が5桁以上では登録できない'do
      @minute.meeting_date="20000/10/10"
      @minute.valid?
      expect(@minute.errors.full_messages).to include("Meeting date is invalid")
      end
      it 'meeting_dateのmonth部分が0桁以下では登録できない'do
      @minute.meeting_date="2000//10"
      @minute.valid?
      expect(@minute.errors.full_messages).to include("Meeting date is invalid")
      end
      it 'meeting_dateのmonth部分が3桁以上では登録できない'do
      @minute.meeting_date="2000/100/10"
      @minute.valid?
      expect(@minute.errors.full_messages).to include("Meeting date is invalid")
      end
      it 'meeting_dateのday部分が0桁以下では登録できない'do
      @minute.meeting_date="2000/10/"
      @minute.valid?
      expect(@minute.errors.full_messages).to include("Meeting date is invalid")
      end
      it 'meeting_dateのday部分が3桁以上では登録できない'do
      @minute.meeting_date="2000/10/100"
      @minute.valid?
      expect(@minute.errors.full_messages).to include("Meeting date is invalid")
      end
      it 'all_complete_dateが空では登録できない'do
      @minute.all_complete_date=nil
      @minute.valid?
      expect(@minute.errors.full_messages).to include("All complete date can't be blank")
      end
      it 'all_complete_dateに"/"がないとは登録できない'do
      @minute.all_complete_date="20001010"
      @minute.valid?
      expect(@minute.errors.full_messages).to include("All complete date is invalid")
      end
      it 'all_complete_dateのyear部分が3桁以下では登録できない'do
      @minute.all_complete_date="200/10/10"
      @minute.valid?
      expect(@minute.errors.full_messages).to include("All complete date is invalid")
      end
      it 'all_complete_dateのyear部分が5桁以上では登録できない'do
      @minute.all_complete_date="20000/10/10"
      @minute.valid?
      expect(@minute.errors.full_messages).to include("All complete date is invalid")
      end
      it 'all_complete_dateのmonth部分が0桁以下では登録できない'do
      @minute.all_complete_date="2000//10"
      @minute.valid?
      expect(@minute.errors.full_messages).to include("All complete date is invalid")
      end
      it 'all_complete_dateのmonth部分が3桁以上では登録できない'do
      @minute.all_complete_date="2000/100/10"
      @minute.valid?
      expect(@minute.errors.full_messages).to include("All complete date is invalid")
      end
      it 'all_complete_dateのday部分が0桁以下では登録できない'do
      @minute.all_complete_date="2000/10/"
      @minute.valid?
      expect(@minute.errors.full_messages).to include("All complete date is invalid")
      end
      it 'all_complete_dateのday部分が3桁以上では登録できない'do
      @minute.all_complete_date="2000/10/100"
      @minute.valid?
      expect(@minute.errors.full_messages).to include("All complete date is invalid")
      end
      it 'contentが空では登録できない'do
      @minute.content=nil
      @minute.valid?
      expect(@minute.errors.full_messages).to include("Content can't be blank")
      end
    end
  end
end
