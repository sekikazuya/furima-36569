# furimaアプリテーブル設計

## usersテーブル

| Column             | Type       | Options                 |
| ------------------ | ---------- | ----------------------- |
| nickname           | string     | null: false             |
| email              | string     | null: false             |
| encrypted_password | string     | null: false             |
| last_name          | string     | null: false, 全角のみ    |
| first_name         | string     | null: false, 全角のみ    |
| last_name_kana     | string     | null: false, 全角カナのみ |
| first_nama_kana    | string     | null: false, 全角カナのみ |
| birthday           | date       | null: false             |

### Association

- has_many :items
- has_many :purchase_records

## itemsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| introduction     | text       | null: false                    |
| category_id      | integer    | null: false                    |
| status_id        | integer    | null: false                    |
| shipping_cost_id | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| delivery_time_id | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true | 

### Association

- belongs_to :user
- has_many :orders

## ordersテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true | 

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addressテーブル

| Column             | Type       | Options                                   |
| ------------------ | ---------- | ----------------------------------------- |
| postal_code        | string     | null: false, 「3桁ハイフン4桁」半角文字列のみ) |
| prefecture_id      | integer    | null: false                               |
| city               | string     | null: false                               |
| house_number       | string     | null: false                               |
| building_name      | string     |                                           |
| phone_number       | string     | null: false                               |
| order              | references | null: false, foreign_key: true            |

### Association

- belongs_to :order