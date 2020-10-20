# テーブル設計

## users テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| nickname       | string  | null: false |
| email          | string  | null: false |
| password       | string  | null: false |
| firstname      | string  | null: false |
| lastname       | string  | null: false |
| firstname_kana | string  | null: false |
| lastname_kana  | string  | null: false |
| birth_y        | integer | null: false |
| birth_m        | integer | null: false |
| birth_d        | integer | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| image         | text       | null: false                    |
| item          | string     | null: false                    |
| text          | text       | null: false                    |
| category      | string     | null: false                    |
| condition     | string     | null: false                    |
| shipping_fee  | string     | null: false                    |
| shipping_from | string     | null: false                    |
| shipping_date | string     | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| creditcard_num | integer    | null: false                    |
| expiration_m   | integer    | null: false                    |
| expiration_y   | integer    | null: false                    |
| security_code  | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false. foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery

## deliveries テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| prefecture   | string     | null: false                    |
| municipality | string     | null: false                    |
| house_num    | string     | null: false                    |
| building     | string     |                                |
| phone_num    | integer    | null: false                    |
| purchase     | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase