require 'rails_helper'

describe Brand do
  describe '#update' do
    it "brandがないと登録できないこと" do
      brand = build(:brand, brand: " ")
      brand.valid?
      expect(brand.errors[:brand]).to include("can't be blank" )
    end

  end
end