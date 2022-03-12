# テーブル設計

## usersテーブル

| Column             | Type   | Options                        |
| ------------------ | ------ | ------------------------------ |
| email              | string | null: false, unique constraint |
| password           | string | null: false                    |
| encrypted_password | string | null: false                    |
| nickname           | string | null: false                    |

## marketsテーブル

| Column           | Type      | Options                        |
| ---------------- | --------- | ------------------------------ |
| item_name        | string    | null: false                    |
| description_id   | text      | null: false                    |
| category_id      | integer   | null: false                    |
| condition_id     | integer   | null: false                    |
| postage_payer_id | integer   | null: false                    |
| shipping_from_id | integer   | null: false                    |
| shipping_date_id | integer   | null: false                    |
| price            | integer   | null: false                    |
| user             | reference | null: false, foreign_key: true |

## ordersテーブル

| Column       | Type      | options                        |
| ------------ | ------    | ------------------------------ |
| postal_code  | string    | null: false                    |
| prefecture   | string    | null: false                    |
| city         | string    | null: false                    |
| address_1    | string    | null: false                    |
| address_2    | string    |                                |
| phone_number | string    | null: false                    |
| user         | reference | null: false, foreign_key: true |
| market       | reference | null: false, foreign_key: true |