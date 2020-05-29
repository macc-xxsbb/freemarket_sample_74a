require 'rails_helper'

describe User do
  describe '#create' do

    it "全ての条件が整っていれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nicknameがない場合は登録できないこと" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "emailがない場合は登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "password_confirmationがない場合は登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "family_nameがない場合は登録できないこと" do
      user = build(:user, family_name: nil)
      user.valid?
      expect(user.errors[:family_name]).to include("can't be blank")
    end

    it "first_nameがない場合は登録できないこと" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it "family_name_kanaがない場合は登録できないこと" do
      user = build(:user, family_name_kana: nil)
      user.valid?
      expect(user.errors[:family_name_kana]).to include("can't be blank")
    end

    it "first_name_kanaがない場合は登録できないこと" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end

    it "birthdateがない場合は登録できないこと" do
      user = build(:user, birthdate: nil)
      user.valid?
      expect(user.errors[:birthdate]).to include("can't be blank")
    end

    it "phoneがない場合は登録できないこと" do
      user = build(:user, phone: nil)
      user.valid?
      expect(user.errors[:phone]).to include("can't be blank")
    end

    it "重複したemailが存在する場合は登録できないこと" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "passwordが7桁以上であれば登録できること" do
      user = build(:user, password: "aaaaaaa")
      expect(user).to be_valid 
    end

    it "passwordが6桁以下では登録できないこと" do
      user = build(:user, password: "aaaaaa", password_confirmation: "aaaaaa")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
    end

    it "passwordとpassword_confirmationが一致しない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "phoneが10桁であれば登録できること" do
      user = build(:user, phone: "1111111111")
      expect(user).to be_valid
    end

    it "phoneが11桁であれば登録できること" do
      user = build(:user, phone: "11111111111")
      expect(user).to be_valid
    end

    it "phoneが12桁以上では登録できないこと" do
      user = build(:user, phone: "111111111111")
      user.valid?
      expect(user.errors[:phone]).to include("is too long (maximum is 11 characters)")
    end

    it "phoneが9桁以下では登録できないこと" do
      user = build(:user, phone: "111111111")
      user.valid?
      expect(user.errors[:phone]).to include("is too short (minimum is 10 characters)")
    end

  end
end
