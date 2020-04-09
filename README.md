# README
## productテーブル
|Column         |Type   |Options|
|---------------|-------|-------|
|name           |string |null: false|
|explain        |text   ||
|price          |integer|null: false|
|category_id    |integer|null: false, foreign_key: true|
|brand_id       |integer||
|condition_id   |integer|null: false|
|burden_id      |integer|null: false|
|delivery_day_id|integer|null: false|
|prefecture_id  |integer|null: false|
|user_id        |integer|null: false, foreign_key: true|
|exhibition_id  |integer||

### Association
has_many :images, dependent: :destroy
belongs_to :category
belongs_to :user
has_one :order, dependent: :destroy
has_many :likes, dependent: :destroy
has_many :liking_users, through: :likes


## categoryテーブル
|Column         |Type   |Options|
|---------------|-------|-------|
|name           |string |null: false|
|ancestry        |string |null: false, index|
### Association
has_many :products
has_ancestry

## brandテーブル
|Column         |Type   |Options|
|---------------|-------|-------|
|name           |string |null: false|
### Association
has_many :products

## imageテーブル
|Column         |Type   |Options|
|---------------|-------|-------|
|image          |text   |null: false|
|product_id     |integer|null: false, foreign_key: true|
### Association
belongs_to :product

## userテーブル
|Column         |Type   |Options|
|---------------|-------|-------|
|nickname       |string |null: false|
|email          |string |null: false, uniqe: true|
|encrypted_password|string |null: false, uniqe: true, min: 7|
|last_name      |string |null: false|
|first_name     |string |null: false|
|last_name_kana |string |null: false|
|first_name_kana|string |null: false|
|birthday       |integer|null: false|
|image          |string ||
### Association
has_many :products, dependent: :destroy
has_many :addresses, dependent: :destroy
has_many :cards, dependent: :destroy
has_many :orders, dependent: :destroy
has_many :likes, dependent: :destroy
has_many :like_products, through: :likes


## addressテーブル
|Column         |Type   |Options|
|---------------|-------|-------|
|last_name      |string |null: false|
|first_name     |string |null: false|
|last_name_kana |string |null: false|
|first_name_kana|string |null: false|
|zip_code       |string |null: false|
|city           |string |null: false|
|address        |string |null: false|
|building       |string ||
|prefecture_id  |integer|null: false|
|phone_number   |string |null: false, uniqe: true|
|user_id        |integer|null: false, foreign_key: true|
### Association
belongs_to :user
has_many :orders

## cardテーブル
|Column         |Type   |Options|
|---------------|-------|-------|
|payjp_id      |string |null: false|
|user_id       |integer|null: false, foreign_key: true|
### Association
belongs_to :user


## orderテーブル
|Column         |Type   |Options|
|---------------|-------|-------|
|address_id     |string |null: false, foreign_key: true|
|product_id     |integer|null: false, foreign_key: true|
|user_id        |integer|null: false, foreign_key: true|
### Association
belongs_to :product
belongs_to :user
belongs_to :address

## likeテーブル
|Column         |Type   |Options|
|---------------|-------|-------|
|product_id     |integer|null: false, foreign_key: true|
|user_id        |integer|null: false, foreign_key: true|
### Association
belongs_to :product
belongs_to :user