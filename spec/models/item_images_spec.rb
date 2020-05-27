require 'rails_helper'

describe ItemImage do
  describe '#create' do

    it "imageがない場合は登録できないこと" do
      item_image = build(:item_image, image: "")
      item_image.valid?
      expect(item_image.errors[:image]).to include("can't be blank")
    end

    it "itemがない場合は登録できないこと" do
      item_image = build(:item_image, item: "")
      item_image.valid?
      expect(item_image.errors[:item]).to include("can't be blank")
    end

  end
end