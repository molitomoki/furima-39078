require 'rails_helper'
 RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
   describe "ユーザー新規登録" do
      context '新規登録できる場合' do
        it "全ての必須項目が存在すれば登録できる" do
          expect(@user).to be_valid
        end
      end
      context '新規登録できない場合' do
        it 'ニックネームが必須であること' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it "メールアドレスが必須であること" do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "Email can't be blank"
        end
        it 'メールアドレスが一意性であること' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end
        it 'メールアドレスは、@を含む必要があること' do
          @user.email = 'testmail'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
        end
        it "パスワードが必須であること" do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it 'パスワードは、6文字以上での入力が必須であること' do
          @user.password = '1234a'
          @user.password_confirmation = '1234a'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end
        it 'パスワードは、半角英数字混合での入力が必須であること' do
          @user.password = '123456'
          @user.password_confirmation = '123456'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
        end
        it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
          @user.password = '12345a'
          @user.password_confirmation = '65432b'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        
        it 'お名前(全角)は、名字が必須であること' do
          @user.last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end
        it 'お名前(全角)は、名前が必須であること' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end
        
        it 'お名前(全角)の名字は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
          @user.last_name = 'yamada'
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name には全角文字を使用してください")
        end
        it 'お名前(全角)の名前は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
          @user.first_name = 'rikutaro'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name には全角文字を使用してください")
        end
        
        it 'お名前カナ(全角)は、名字が必須であること' do
          @user.last_name_reading = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name reading can't be blank")
        end
        it 'お名前カナ(全角)は、名前が必須であること' do
          @user.first_name_reading = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name reading can't be blank")
        end
        
        it 'お名前(全角)の名字は、全角（カタカナ）での入力が必須であること' do
          @user.last_name_reading = '山だ'
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name reading には全角文字（カタカナ）を使用してください")
        end
        it 'お名前(全角)の名前は、全角（カタカナ）での入力が必須であること' do
          @user.first_name_reading = 'りく太郎'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name reading には全角文字（カタカナ）を使用してください")
        end
        it '生年月日が必須であること' do
          @user.birth_day = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birth day can't be blank")
        end

     end
   end
 end