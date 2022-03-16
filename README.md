# テーブル設計

## usersテーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| nickname           | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_pronounce     | string  | null: false               |
| first_pronounce    | string  | null: false               |
| birth_day          | date    | null: false               |
 
### アソシエーション

- has_many :markets
- has_many :orders

## marketsテーブル

| Column           | Type       | Options                         |
| ---------------- | ---------- | ------------------------------- |
| item_name        | string     | null: false                     |
| description      | text       | null: false                     |
| category_id      | integer    | null: false                     |
| condition_id     | integer    | null: false                     |
| postage_payer_id | integer    | null: false                     |
| prefecture_id    | integer    | null: false                     |
| shipping_date_id | integer    | null: false                     |
| price            | integer    | null: false                     |
| user             | references | null: false, foreign_key: true  |

### アソシエーション

- belongs_to :user
- has_one :order

## ordersテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| market        | references | null: false, foreign_key: true |

### アソシエーション

- belongs_to :user
- belongs_to :market
- has_one :shipping

## shippingsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address_1     | string     | null: false                    |
| address_2     | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### アソシエーション

- belongs_to :order