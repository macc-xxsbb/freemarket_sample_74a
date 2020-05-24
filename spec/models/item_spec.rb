require 'rails_helper'

describe Item do
  describe '#update' do
    it "item_nameがないと登録できないこと"do
      item = build(:item, item_name: " ")
      item.valid?
      expect(item.errors[:item_name]).to include("can't be blank" )
    end

    it "priceがないと登録ができないこと" do
      item = build(:item, price: " ")
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it "contentがないと登録ができないこと" do
      item = build(:item, content: " ")
      item.valid?
      expect(item.errors[:content]).to include("can't be blank")
    end

    it "sizeがないと登録できないこと" do
        item = build(:item, size: "")
        item.valid?
        expect(item.errors[:size]).to include("can't be blank")
    end

    it "statusがないと登録できないこと" do
      item = build(:item, status: "")
      item.valid?
      expect(item.errors[:status]).to include("can't be blank")
    end

    
  end
end