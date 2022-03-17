require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

    context '新規登録できない場合' do
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it 'emailが一意性でなければ登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailが@を含まないと登録できない' do
        @user.email = 'xyzexample.com'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it 'passwordが6文字未満では登録できない' do
        @user.password = '123ab'
        @user.password_confirmation = '123ab'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end

      it 'passwordが半角英数混合でなければ登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password Include both letters and numbers"
      end

      it 'passwordとpassword_confirmationが一致していなければ登録できない' do
        @user.password = '123abc'
        @user.password = '123xyz'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end

      it 'last_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.last_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name is invalid"
      end

      it 'first_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.first_name = 'i'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid"
      end

      it 'last_pronounceが空では登録できない' do
        @user.last_pronounce = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last pronounce can't be blank"
      end

      it 'first_pronounceが空では登録できない' do
        @user.first_pronounce = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First pronounce can't be blank"
      end

      it 'last_pronounceが全角（カタカナ）でなければ登録できない' do
        @user.last_pronounce = 'あ'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last pronounce is invalid"
      end

      it 'first_pronounceが全角（カタカナ）でなければ登録できない' do
        @user.first_pronounce = 'い'
        @user.valid?
        expect(@user.errors.full_messages).to include "First pronounce is invalid"
      end

      it 'birth_dayが空では登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth day can't be blank"
      end
    end
  end
end