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

- has_many :items
- has_many :items_categories
- has_many :

------------------------------------
## 商品
## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|item_name|string|-------|
|image|text|-------|
|size|string|-------|
|content|text|-------|
|status|type|-------|

### Association

- belongs_to :user
- has_many :products_image

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

- belongs_to :
- belongs_to :


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

- belongs_to :
- belongs_to :

------------------------------------
## コメント
## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|comment|text|-------|
|user_id|integer|-------|

### Association

- belongs_to :
- belongs_to :

------------------------------------
## カテゴリー
## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|title|string|-------|


### Association

- belongs_to :
- belongs_to :

------------------------------------
## ブランド
## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|brand|string|-------|

### Association

- belongs_to :
- belongs_to :

------------------------------------
## 商品/カテゴリー
## items_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|categoriy_id|integer|-------|
|item_id|integer|-------|

### Association

- belongs_to :item
- belongs_to :categoriy

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
