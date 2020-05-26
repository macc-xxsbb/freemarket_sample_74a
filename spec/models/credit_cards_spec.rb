require 'rails_helper'

describe CreditCard do
  describe '#create' do

    it "全ての条件が整っていれば登録できること" do
      credit_card = build(:credit_card)
      expect(credit_card).to be_valid
    end

    it "customer_idがない場合は登録できないこと" do
      credit_card = build(:credit_card, customer_id: nil)
      credit_card.valid?
      expect(credit_card.errors[:customer_id]).to include("can't be blank")
    end
    
    it "card_idがない場合は登録できないこと" do
      credit_card = build(:credit_card, card_id: nil)
      credit_card.valid?
      expect(credit_card.errors[:card_id]).to include("can't be blank")
    end

  end
end