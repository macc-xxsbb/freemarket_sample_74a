require 'rails_helper'

describe Credit_cards do
  describe '#create' do

    it "全ての条件が整っていれば登録できること" do
      credit_card = build(:credit_card)
      expect(credit_card).to be_valid
    end

    it "card_numberがない場合は登録できないこと" do
      credit_card = build(:credit_card, card_number: nil)
      credit_card.valid?
      expect(credit_card.errors[:card_number]).to include("can't be blank")
    end

    it "card_yearがない場合は登録できないこと" do
      credit_card = build(:credit_card, card_year: nil)
      credit_card.valid?
      expect(credit_card.errors[:card_year]).to include("can't be blank")
    end

    it "card_monthがない場合は登録できないこと" do
      credit_card = build(:credit_card, card_month: nil)
      credit_card.valid?
      expect(credit_card.errors[:card_month]).to include("can't be blank")
    end

    it "security_cordがない場合は登録できないこと" do
      credit_card = build(:credit_card, security_code: nil)
      credit_card.valid?
      expect(credit_card.errors[:security_cord]).to include("can't be blank")
    end

    it "card_numberが16桁でないと登録できないこと" do
      credit_card = build(:credit_card, card_number: "1111111111111111")
      credit_card.valid?
      expect(credit_card.errors[:card_number]).to include("shuld be 16 caracters")
    end

    it "card_numberが整数でないと登録できないこと" do
      credit_card = build(:credit_card, card_number: 1111111111111111)
      credit_card.valid?
      expect(credit_card.errors[:card_number]).to include("can't be blank")
    end

    it "security_cordが5桁以上の場合は登録できないこと" do
      credit_card = build(:credit_card, security_cord: 11111)
      credit_card.valid?
      expect(credit_card.errors[:security_cord]).to include("is too long")
    end

    it "security_cordが2桁以下の場合は登録できないこと" do
      credit_card = build(:credit_card, security_cord: 11)
      credit_card.valid?
      expect(credit_card.errors[:security_cord]).to include("is too short")
    end

    it "security_cordが整数でないと登録できないこと" do
      credit_card = build(:credit_card, security_cord: 111)
      credit_card.valid?
      expect(credit_card.errors[:security_cord]).to include("shuold be number")
    end

  end
end