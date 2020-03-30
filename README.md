# README
## productテーブル
|Column         |Type   |Options|
|---------------|-------|-------|
|name           |string |null: false|
|explain        |text   ||
|price          |integer|null: false|
|category_id    |integer|null: false, foreign_key: true|
|brand_id       |integer|foreign_key: true|
|condition_id   |integer|null: false, foreign_key: true|
|burden_id      |integer|null: false, foreign_key: true|
|delivery_day_id|integer|null: false, foreign_key: true|
|prefecture_id  |integer|null: false|
|user_id        |integer|null: false, foreign_key: true|
|exhibiting_id  |integer||
|sold           |integer||


### Association
has_many :images, dependent: :destroy
belongs_to :category
belongs_to :brand
belongs_to_active_hash :condition
belongs_to_active_hash :burden
belongs_to_active_hash :delivery_day
belongs_to :user
has_one :order, dependent: :destroy

## categoryテーブル
|Column         |Type   |Options|
|---------------|-------|-------|
|genre          |string |null: false|
### Association
has_many :products

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
|shipping_address|string|null: false|
|product_id     |integer|null: false, foreign_key: true|
|user_id        |integer|null: false, foreign_key: true|
### Association
belongs_to :product
belongs_to :user