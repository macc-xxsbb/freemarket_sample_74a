require 'rails_helper'

describe Shipping do
  describe '#create' do

    it "ship_baseがない場合は登録できないこと" do
      shipping = build(:shipping, ship_base: nil)
      shipping.valid?
      expect(shipping.errors[:ship_base]).to include("can't be blank")
    end

    it "ship_methodがない場合は登録できないこと" do
      shipping = build(:shipping, ship_method: nil)
      shipping.valid?
      expect(shipping.errors[:ship_method]).to include("can't be blank")
    end

    it "ship_dateがない場合は登録できないこと" do
      shipping = build(:shipping, ship_date: nil)
      shipping.valid?
      expect(shipping.errors[:ship_date]).to include("can't be blank")
    end

    it "item_idがない場合は登録できないこと" do
      shipping = build(:shipping, item_id: nil)
      shipping.valid?
      expect(shipping.errors[:item_id]).to include("can't be blank")
    end

    it "prefecture_idがない場合は登録できないこと" do
      shipping = build(:shipping, prefecture_id: nil)
      shipping.valid?
      expect(shipping.errors[:prefecture_id]).to include("can't be blank")
    end

  end
end