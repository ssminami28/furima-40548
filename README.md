
## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |

has_many :items
has_many :orders

## items テーブル

| Column                 | Type       | Options     |
| ---------------------- | ---------- | ----------- |
| title                  | string     | null: false |
| description            | text       | null: false |
| category_id            | integer    | null: false |
| sales_status_id        | integer    | null: false |
| prefecture_id          | integer    | null: false |
| price                  | integer    | null: false |
| user                   | references | null: false, foreign_key: true |
| scheduled_delivery_id  | integer    | null: false |
| shipping_fee_status_id | integer    | null: false |

belongs_to :user
has_one :order



## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

belongs_to :user
belongs_to :item
has_one :address

## addresses テーブル

| Column           | Type       | Options                        | 
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city_name        | string     | null: false                    |
| block_name       | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |
| order            | references | null: false, foreign_key: true |

belongs_to :order