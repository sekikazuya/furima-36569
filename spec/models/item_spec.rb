require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品が出品できる場合' do
      it '商品画像、商品名、商品の説明、カテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数、価格が存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品が出品できない場合' do
      it '商品画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空では出品できない' do
        @item.introduction = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end
      it 'カテゴリーの情報が空では出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Can't be blank")
      end
      it 'カテゴリーの情報が初期値のままでは出品できない' do
        @item.category_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Can't be blank")
      end
      it '商品の状態の情報が空では出品できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status Can't be blank")
      end
      it '商品の状態の情報が初期値のままでは出品できない' do
        @item.status_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status Can't be blank")
      end
      it '発送費の負担の情報が空では出品できない' do
        @item.shipping_cost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost Can't be blank")
      end
      it '発送費の負担の情報が初期値のままでは出品できない' do
        @item.shipping_cost_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost Can't be blank")
      end
      it '発送元の地域の情報が空では出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture Can't be blank")
      end
      it '発送元の地域の情報が初期値のままでは出品できない' do
        @item.prefecture_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture Can't be blank")
      end
      it '発送までの日数の情報が空では出品できない' do
        @item.delivery_time_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time Can't be blank")
      end
      it '発送までの日数の情報が初期値のままでは出品できない' do
        @item.delivery_time_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time Can't be blank")
      end
      it '価格が空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が299円以下だと出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '価格が1,000,000円以上だと出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it '価格が半角英字では出品できない' do
        @item.price = 'three handred'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '価格が全角英字では出品できない' do
        @item.price = 'ｔｈｒｅｅ　ｈａｎｄｒｅｄ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '価格が全角数字では出品できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '価格が漢字では出品できない' do
        @item.price = '三百'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '価格がひらがなでは出品できない' do
        @item.price = 'さんびゃく'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '価格が全角カタカナでは出品できない' do
        @item.price = 'サンビャク'
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end
      it '価格が半角カタカナでは出品できない' do
        @item.price = 'ｻﾝﾋﾞｬｸ'
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end
      it 'userが紐づいていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
