require 'rails_helper'

describe Item do
  describe '#create' do

    it "item_nameがない場合は登録できないこと" do
      item = build(:item, item_name: "")
      item.valid?
      expect(item.errors[:item_name]).to include("can't be blank")
    end

    it "priceがない場合は登録できないこと" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it "contentがない場合は登録できないこと" do
      item = build(:item, content: "")
      item.valid?
      expect(item.errors[:content]).to include("can't be blank")
    end

    it "category_idがない場合は登録できないこと" do
      item = build(:item, category_id: "")
      item.valid?
      expect(item.errors[:category_id]).to include("can't be blank")
    end

    it "user_idがない場合は登録できないこと" do
      item = build(:item, user_id: "")
      item.valid?
      expect(item.errors[:user_id]).to include("can't be blank")
    end

    it "status_idがない場合は登録できないこと" do
      item = build(:item, status_id: "")
      item.valid?
      expect(item.errors[:status_id]).to include("can't be blank")
    end

  end
end 