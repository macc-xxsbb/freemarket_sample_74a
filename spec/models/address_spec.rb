require 'rails_helper'

describe Address do
  describe '#create' do

    it "全ての条件が整っていれば登録できること" do
      address = build(:address)
      expect(address).to be_valid
    end

    it "zipcodeがない場合は登録できないこと" do
      address = build(:address, zipcode: nil)
      address.valid?
      expect(address.errors[:zipcode]).to include("can't be blank")
    end

    it "prefecture_idがない場合は登録できないこと" do
      address = build(:address, zipcode: nil)
      address.valid?
      expect(address.errors[:zipcode]).to include("can't be blank")
    end

    it "cityがない場合は登録できないこと" do
      address = build(:address, zipcode: nil)
      address.valid?
      expect(address.errors[:zipcode]).to include("can't be blank")
    end

    it "addressがない場合は登録できないこと" do
      address = build(:address, zipcode: nil)
      address.valid?
      expect(address.errors[:zipcode]).to include("can't be blank")
    end

  end
end
