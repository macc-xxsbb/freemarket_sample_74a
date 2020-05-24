require 'rails_helper'

describe Shipping do
  describe '#create' do

    it "ship_baseがない場合は登録できないこと" do
      shipping = build(:shipping, ship_base: "")
      shipping.valid?
      expect(shipping.errors[:ship_base]).to include("can't be blank")
    end

    it "regionがない場合は登録できないこと" do
      shipping = build(:shipping, region: "")
      shipping.valid?
      expect(shipping.errors[:region]).to include("can't be blank")
    end

    it "ship_dateがない場合は登録できないこと" do
      shipping = build(:shipping, ship_date: "")
      shipping.valid?
      expect(shipping.errors[:ship_date]).to include("can't be blank")
    end

    it "prefecture_idがない場合は登録できないこと" do
      shipping = build(:shipping, prefecture_id: "")
      shipping.valid?
      expect(shipping.errors[:prefecture_id]).to include("can't be blank")
    end

  end
end 