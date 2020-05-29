# README
# freemarket_sample_74a DB設計

## ユーザー
## usersテーブル

|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|nickname|string|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthdate|date|null: false|
|phone|string|null: false|

### Association

- has_one :address
- has_one :credit_card

- has_many :credits
- has_many :items
- has_many :comments
- has_many :buyed_items
- has_many :saling_items
- has_many :sold_items
------------------------------------
## 商品
## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|item_name|string|null: false|
|price|integer|null: false|
|size|string|null: false|
|content|text|null: false|
|user_id|integer|null: false|
|category_id|integer|null: false, foreign_key: true|
|shipping_id|integer|null: false|
|status_id|integer|null: false|
|saler_id|integer|null: false|
|buyer_id|integer|null: false|
|brand_id|integer|null: false|

### Association

- belongs_to :user
- belongs_to :category
- belongs_to :brand
- belongs_to :shipping
- has_many :item_images
- has_many :comments
- belongs_to :saler
- belongs_to :buyer
- belongs_to :status
- belongs_to :prefecture
------------------------------------
## 発送
## shippingテーブル

|Column|Type|Options|
|------|----|-------|
|ship_date_id|integer|null: false|
|item_id|integer|null: false, foreign_key: true|
|prefecture_id|integer|null: false|
|ship_base_id|integer|null: false|

### Association

- belongs_to :item

------------------------------------
## クレジットカード
## credit_cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|customer_id|integer|null: false|
|card_id|integer|null: false|

### Association

- belongs_to :user

------------------------------------
## コメント
## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
|comment|text|null: false|

### Association

- belongs_to :user
- belongs_to :item

------------------------------------
## カテゴリー
## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|title|string|null: false|

### Association

- has_many :items

------------------------------------
## ブランド
## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|brand|string|null: false|

### Association

- belongs_to :item

------------------------------------

## 商品画像
## item_imegesテーブル

|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|item_id|integer|null: false, foreign_key: true|

### Association

- belongs_to :item

------------------------------------
## アドレス
## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|prefecture_id|integer|null: false|
|city|string|null: false|
|zipcode|integer|null: false|
|address|text|null: false|
|user_id|integer|null: false|
|building|string| |

### Association

belongs_to :user

------------------------------------
## 商品購入
## item_peymentテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false|
|saler_id|integer|null: false|
|buyer_id|integer|null: false|

### Association

belongs_to :item