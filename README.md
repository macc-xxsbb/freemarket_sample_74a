# README
# freemarket_sample_74a DB設計

## ユーザー
## usersテーブル

|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|nickname|string|null: false|
|name|string|null: false|
|name_kana|string|null: false|
|birthdate|integer|null: false|
|phone|integer|null: false|


### Association


- has_many :credits
- has_many :items
- has_many :comments




------------------------------------
## 商品
## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|item_name|string|-------|
|image|text|-------|
|price|integer|-------|
|size|string|-------|
|content|text|-------|
|status|type|-------|


### Association

- belongs_to :user
- has_many :item_images
- has_many :comments
- belongs_to :shipping
- belongs_to :brand

------------------------------------
## 発送
## shippingテーブル

|Column|Type|Options|
|------|----|-------|
|item_name|string|-------|
|price|integer|-------|
|region|string|-------|
|city|string|-------|
|block|string|-------|
|shipMethod|string|-------|

### Association

- belongs_to :item


------------------------------------
## クレジットカード
## creditテーブル

|Column|Type|Options|
|------|----|-------|
|credit_cardapproval_code|integer|-------|
|Exp|integer|-------|
|security_cord|integer|-------|
|user_id|integer|-------|

### Association

- belongs_to :user

------------------------------------
## コメント
## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|comment|text|-------|
|user_id|integer|-------|

### Association

- belongs_to :user
- belongs_to :item

------------------------------------
## カテゴリー
## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|title|string|-------|


### Association

- belongs_to :item_category

------------------------------------
## ブランド
## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|brand|string|-------|

### Association

- has_many :items

------------------------------------
## 商品/カテゴリー
## items_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|categoriy_id|integer|-------|
|item_id|integer|-------|

### Association


- has_many :items
- has_many :categories
- has_many :products_image

------------------------------------
## ブランド
## item_imegesテーブル

|Column|Type|Options|
|------|----|-------|
|imege|text|-------|
|item_id|integer|-------|

### Association

- belongs_to :item

------------------------------------












追加事項


-----------------------------------
## snsテーブル

|Column|Type|Options|
|------|----|-------|

### Association

- belongs_to :
- belongs_to :

------------------------------------
## favoritesテーブル

|Column|Type|Options|
|------|----|-------|

### Association

- belongs_to :
- belongs_to :

------------------------------------
