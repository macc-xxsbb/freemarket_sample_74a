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
- has_many :
- has_many :

------------------------------------
## 商品
## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|itemname|----|-------|
|image|----|-------|
|size|----|-------|
|content|----|-------|
|status|----|-------|

### Association

- belongs_to :user
- has_many :products_image

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

- belongs_to :
- belongs_to :


------------------------------------
## クレジットカード
## creditテーブル

|Column|Type|Options|
|------|----|-------|

### Association

- belongs_to :
- belongs_to :

------------------------------------
## コメント
## commentsテーブル

|Column|Type|Options|
|------|----|-------|

### Association

- belongs_to :
- belongs_to :

------------------------------------
## カテゴリー
## categoriesテーブル

|Column|Type|Options|
|------|----|-------|

### Association

- belongs_to :
- belongs_to :

------------------------------------
## ブランド
## brandsテーブル

|Column|Type|Options|
|------|----|-------|

### Association

- belongs_to :
- belongs_to :

------------------------------------
## 商品/カテゴリー
## items_categoriesテーブル

|Column|Type|Options|
|------|----|-------|

### Association

- belongs_to :user
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
