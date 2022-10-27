# README

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| profile            | text   |             |

### Association

- has_many :chat_room_users
- has_many :chat_rooms, through: :chat_room_users
- has_many :chat_messages
- has_many :direct_room_users
- has_many :direct_rooms, through: :direct_room_users
- has_many :direct_messages
- has_many :follows

## chat_rooms テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| name          | string  | null: false |
| introduction  | text    | null: false |

### Association

- has_many :chat_room_users
- has_many :chat_messages
- has_many :categories, through: :chat_room_categories

## chat_room_users テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| chat_rooms | references | null: false, foreign_key: true |

### Association

- belongs_to :chat_room
- belongs_to :user

## chat_messages テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| content       | string     |                                |
| user          | references | null: false, foreign_key: true |
| chat_room_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :chat_room
- belongs_to :user

## direct_rooms テーブル

|Column|Type|Options|
|------|----|-------|

### Association

- has_many :direct_messages
- has_many :direct_room_users

## direct_room_users テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| direct_room_id | references | null: false, foreign_key: true |

### Association

- belongs_to :direct_room
- belongs_to :user

## direct_messages テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| direct_room_id | references | null: false, foreign_key: true |

### Association

- belongs_to :direct_room
- belongs_to :user

## follows テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| follower_id    | references | null: false, foreign_key: true |
| followed_id    | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## categories テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| genre_id    | references | null: false, foreign_key: true |

### Association

- has_many :chat_rooms, through: :chat_room_categories

## chat_room_categories テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| chat_room_id   | references | null: false, foreign_key: true |
| category_id    | references | null: false, foreign_key: true |

### Association

- belongs_to :chat_rooms
- belongs_to :categories


