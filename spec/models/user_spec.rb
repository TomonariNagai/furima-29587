require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname,email,password,password_confirmation,firstname,lastname,firstname_kana,lastname_kana,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailが@を含まない場合登録できない" do 
        @user.email = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = "111aa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが英字のみでは登録できない" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password include both letters and numbers")
      end
      it "passwordが数字のみでは登録できない" do
        @user.password = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password include both letters and numbers")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "firstnameが空では登録できない" do
        @user.firstname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end
      it "firstnameが半角では登録できない" do
        @user.firstname = "ﾀﾅｶ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname Full-width characters")
      end
      it "lastnameが空では登録できない" do
        @user.lastname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank")
      end
      it "lastnameが半角では登録できない" do
        @user.lastname = "ﾊｼﾞﾒ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname Full-width characters")
      end
      it "firstname_kanaが空では登録できない" do
        @user.firstname_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana can't be blank")
      end
      it "firstname_kanaがカタカナではない場合登録できない" do
        @user.firstname_kana = "田中"
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana Full-width katakana characters")
      end
      it "lastname_kanaが空では登録できない" do
        @user.lastname_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana can't be blank")
      end
      it "lastname_kanaがカタカナではない場合登録できない" do
        @user.lastname_kana = "元"
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana Full-width katakana characters")
      end
      it "birthdayが空では登録できない" do        
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
