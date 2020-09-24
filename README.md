# README

# FURIMA DB設計
## users table
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|password|string|null: false|
|email|string|null: false, unique: true, index:true|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kana|string|null: false|
|birth_date|date|null: false|
### Association
- has_many :todo_lists
- has_many:seller_items, foreign_key: true
- has_many:buyer_items, foreign_key: true
- has_one :profile, dependent: :destroy
- has_one :sending_destination, dependent: :destroy
- has_one :credit_card, dependent: :destroy

## profiles table
|Column|Type|Options|
|------|----|-------|
|introduction|text|
|avatar|string|
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## sending_destinations table
|Column|Type|Options|
|------|----|-------|
|destination_first_name|string|null: false|
|destination_family_name|string|null: false|
|destination_first_name_kana|string|null: false|
|destination_family_name_kana|string|null: false|
|post_code|integer(7)|null: false|
|area|string|null: false|
|city|string|null: false|
|house_number|string|
|building_name|string|
|phone_number|integer|unique: true|
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- Gem : jp_prefecture

## credit_cards table
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|
### Association
- belongs_to :user
- Gem : payjp

## todo_lists table
|Column|Type|Options|
|------|----|-------|
|list|text|null: false|
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## items table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|introduction|text|null: false|
|price|integer|null: false|
|brand|references|foreign_key: true|
|item_condition|references|null: false, foreign_key: true|
|postage_payer|references|null: false, foreign_key: true|
|prefecture_code|integer|null: false|
|size|references|null: false, foreign_key: true|
|preparation_day|references|null: false, foreign_key: true|
|postage_type|references|null: false, foreign_key: true|
|item_img|references|null: false, foreign_key: true|
|category|references|null: false, foreign_key: true|
|trading_status|enum|null: false|
|seller|references|null: false, foreign_key: true|
|buyer|references|null: false, foreign_key: true|
|deal_closed_date|timestamp|
### Association
- has_many :item_images, dependent: :destroy
- belongs_to :category
- belongs_to_active_hash :size
- belongs_to_active_hash :item_condition
- belongs_to_active_hash :preparation_day
- belongs_to_active_hash :postage_type
- belongs_to_active_hash :postage_payer
- belongs_to :brand
- belongs_to :seller, class_name: "User"
- belongs_to :buyer, class_name: "User"
- Gem : jp_prefecture

## brands table
|Column|Type|Options|
|------|----|-------|
|brand_name|string|
### Association
- has_many :items

## items_imgs table
|Column|Type|Options|
|------|----|-------|
|url|string|null: false|
|item|references|null: false, foreign_key: true|
### Association
- belongs_to :items

## categories table
|Column|Type|Options|
|------|----|-------|
|categorie_name|string|null: false|
|ancesty|string|null: false|
### Association
- has_many :items