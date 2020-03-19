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
|delivery_way_id|integer|null: false, foreign_key: true|
|delivery_day_id|integer|null: false, foreign_key: true|
|prefecture_id  |integer|null: false, foreign_key: true|
|user_id        |integer|null: false, foreign_key: true|
### Association
has_many :images, dependent: :destroy
belongs_to :category
belongs_to :brand
belongs_to :condition
belongs_to :delivery_way
belongs_to :delivery_day
belongs_to :prefecture
belongs_to :user
belongs_to :order, dependent: :destroy

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

## conditionテーブル
|Column         |Type   |Options|
|---------------|-------|-------|
|status         |string |null: false|
### Association
has_many :products

## delivery_wayテーブル
|Column         |Type   |Options|
|---------------|-------|-------|
|postage        |string |null: false|
### Association
has_many :products

## delivery_dayテーブル
|Column         |Type   |Options|
|---------------|-------|-------|
|turm           |string |null: false|
### Association
has_many :products

## prefectureテーブル
|Column         |Type   |Options|
|---------------|-------|-------|
|name           |string |null: false|
### Association
has_many :products
has_many :addresses

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
|phone_number   |integer|null: false, uniqe: true|
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
|zip_code       |integer|null: false|
|city           |string |null: false|
|address        |text   |null: false|
|building       |text   ||
|prefecture_id  |integer|null: false, foreign_key: true|
|user_id        |integer|null: false, foreign_key: true|
### Association
belongs_to :prefecture
belongs_to :user

## cardテーブル
|Column         |Type   |Options|
|---------------|-------|-------|
|card_company   |integer|null: false|
|card_user      |string |null: false|
|card_number    |integer|null: false|
|card_key       |integer|null: false|
|effective_date_yy|integer|null: false,limit: 2|
|effective_date_mm|integer|null: false,limit: 2|
|user_id        |integer|null: false, foreign_key: true|
### Association
belongs_to :user


## orderテーブル
|Column         |Type   |Options|
|---------------|-------|-------|
|order_day      |string |null: false|
|order_price    |integer|null: false|
|shipping_address|string|null: false|
|product_id     |integer|null: false, foreign_key: true|
|user_id        |integer|null: false, foreign_key: true|
### Association
has_one :product
belongs_to :user