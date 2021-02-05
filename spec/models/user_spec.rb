require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー登録ができる場合' do
    before do
      @user = FactoryBot.build(:user)
    end

    context 'ユーザー登録ができる場合' do
      it '全項目適切に入力されていればユーザー登録できる' do
        expect(@user).to be_valid
      end
      it '苗字がどんな文字でもユーザー登録できる' do
        @user.last_name = "AAA"
        expect(@user).to be_valid
      end
      it '名前がどんな文字でもユーザー登録できる' do
        @user.first_name = "AAA"
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録できない場合' do
      it '苗字が空欄の場合登録できない' do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it '名前が空欄の場合登録できない' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'emailが空欄の場合登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが他に存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailに@がない場合場合登録できない' do
        @user.email = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空欄の場合登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank", "Password confirmation doesn't match Password")
      end
      it 'password_confimationが空欄の場合登録できない' do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confimationが一致しない場合登録できない' do
        @user.password="111111"
        @user.password_confirmation = "222222"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password="11111"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it '社員番号が空欄の場合登録できない' do
        @user.employee_number = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Employee number can't be blank", "Employee number is invalid")
      end
      it '社員番号が4桁以下の場合登録できない' do
        @user.employee_number = "1111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Employee number is invalid")
      end
      it '社員番号が6桁以上の場合登録できない' do
        @user.employee_number = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Employee number is invalid")
      end
      it '社員番号が数字以外は登録できない' do
        @user.employee_number = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Employee number is invalid")
      end
      it '社員番号が全角数字では登録できない' do
        @user.employee_number = "１１１１１"
        @user.valid?
        expect(@user.errors.full_messages).to include("Employee number is invalid")
      end
    end
    
  end
end
