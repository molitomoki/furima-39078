# テーブル設計

## users テーブル

| Column             | Type    | Options                  |
| ------------------ | ------- | ------------------------ |
| nickname           | string  | null: false, unique: true|
| email              | string  | null: false, unique: true|
| password           | string  | null: false              |
| last_name          | string  | null: false              |
| first_name         | string  | null: false              |
| last_name_reading  | string  | null: false              |
| first_name_reading | string  | null: false              |
| birth_date1        | integer | null: false              |
| birth_date2        | integer | null: false              |
| birth_date3        | integer | null: false              |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column                 | Type         | Options                        |
| ---------------------- | ------------ | ------------------------------ |
| name                   | string       | null: false                    |
| info                   | text         | null: false                    |
| genre_id               | integer      | null: false                    |
| status                 | string       | null: false                    |
| shipping_fee_status    | string       | null: false                    |
| prefecture             | string       | null: false                    |
| scheduled_delivery     | string       | null: false                    |
| price                  | integer      | null: false                    |
| user_id                | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order
- has_one :genre
- has_one :image

## orders テーブル

| Column                 | Type         | Options                        |
| ---------------------- | ------------ | ------------------------------ |
| token                  | string       | null: false                    |
| user_id                | references   | null: false, foreign_key: true |
| item_id                | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column                 | Type         | Options                        |
| ---------------------- | ------------ | ------------------------------ |
| postal_code            | string       | null: false                    |
| prefecture             | string       | null: false                    |
| city                   | string       | null: false                    |
| house_number           | string       | null: false                    |
| building_name          | string       | null: false                    |
| phone_number           | string       | null: false                    |
| order_id               | references   | null: false, foreign_key: true |

### Association

- belongs_to :order
 