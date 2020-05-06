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
|name-kana|string|null: false|
|birthdate|string|null: false|
|phone|string|null: false|


### Association

- has_many :products
- has_many :credits
- has_many :items

------------------------------------
## 商品
## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|itemname|----|-------|
|price|----|-------|
|image|----|-------|
|size|----|-------|
|content|----|-------|
|status|----|-------|

### Association

- belongs_to :user
- has_many :products_image
- has_many :comments
- belongs_to :shipping
- belongs_to :brand

------------------------------------
## 発送
## shippingテーブル

|Column|Type|Options|
|------|----|-------|
|itemname|----|-------|
|price|----|-------|
|region|----|-------|
|city|----|-------|
||----|-------|
|------|----|-------|
|------|----|-------|

### Association

- belongs_to :item


------------------------------------
## クレジットカード
## creditテーブル

|Column|Type|Options|
|------|----|-------|

### Association

- belongs_to :user

------------------------------------
## コメント
## commentsテーブル

|Column|Type|Options|
|------|----|-------|

### Association

- belongs_to :user
- belongs_to :item

------------------------------------
## カテゴリー
## categoriesテーブル

|Column|Type|Options|
|------|----|-------|

### Association

- belongs_to :item_category

------------------------------------
## ブランド
## brandsテーブル

|Column|Type|Options|
|------|----|-------|

### Association

- has_many :items

------------------------------------
## 商品/カテゴリー
## items_categoriesテーブル

|Column|Type|Options|
|------|----|-------|

### Association

- has_many :items
- has_many :categories
- has_many :products_image

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
