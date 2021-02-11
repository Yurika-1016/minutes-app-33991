require 'rails_helper'

RSpec.describe ToDoList, type: :model do
  describe 'To Do List投稿機能' do
    before do
      @to_do_list = FactoryBot.build(:to_do_list)
    end

    context '投稿が保存できる時' do
      it '全項目入力されていれば投稿できる' do
        expect(@to_do_list).to be_valid
      end
      it 'list1以外が空でも保存できる' do
        @to_do_list.list2 = nil
        @to_do_list.list3 = nil
        @to_do_list.list4 = nil
        @to_do_list.list5 = nil
        @to_do_list.list6 = nil
        @to_do_list.list7 = nil
        @to_do_list.list8 = nil
        @to_do_list.list9 = nil
        @to_do_list.list10 = nil
        @to_do_list.checked_list1 = nil
        @to_do_list.checked_list2 = nil
        @to_do_list.checked_list3 = nil
        @to_do_list.checked_list4 = nil
        @to_do_list.checked_list5 = nil
        @to_do_list.checked_list6 = nil
        @to_do_list.checked_list7 = nil
        @to_do_list.checked_list8 = nil
        @to_do_list.checked_list9 = nil
        @to_do_list.checked_list10 = nil
        expect(@to_do_list).to be_valid
      end
    end

    context '投稿が保存できない時' do
      it 'list1が空では保存できない' do
        @to_do_list.list1 = nil
        @to_do_list.valid?
        expect(@to_do_list.errors.full_messages).to include("List1 can't be blank")
      end
    end
  end
end
