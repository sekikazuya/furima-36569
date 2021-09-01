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
| birthday           | ActiveHash | null: false             |

### Association

- has_many :items
- has_many :purchase_records

## itemsテーブル

| Column        | Type          | Options                        |
| ------------- | ------------- | ------------------------------ |
| image         | ActiveStorage | null: false                    |
| name          | string        | null: false                    |
| introduction  | text          | null: false                    |
| category      | ActiveHash    | null: false                    |
| status        | ActiveHash    | null: false                    |
| shipping_cost | ActiveHash    | null: false                    |
| ship_from     | ActiveHash    | null: false                    |
| delivery_time | ActiveHash    | null: false                    |
| price         | string        | null: false                    |
| user          | references    | null: false, foreign_key: true | 

### Association

- belongs_to :user
- has_many :purchase_records

## purchase_records

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true | 

### Association

- belongs_to :user
- belongs_to :item
- has_one :order

## ordersテーブル

| Column             | Type       | Options                                   |
| ------------------ | ---------- | ----------------------------------------- |
| postal_code        | string     | null: false, 「3桁ハイフン4桁」半角文字列のみ) |
| prefectures        | ActiveHash | null: false                               |
| municipality       | string     | null: false                               |
| house_number       | string     | null: false                               |
| building_name      | string     |                                           |
| phone_number       | integer    | null: false                               |
| purchase_record    | references | null: false, foreign_key: true            |

### Association

- belongs_to :purchase_record