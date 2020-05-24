require 'rails_helper'

describe Category do
  describe '#update' do
  it "titleがないと登録できないこと" do
    category = build(:category, title: " ")
    category.valid?
    expect(category.errors[:category]).to include("can't be blank" )
  end

  end
end