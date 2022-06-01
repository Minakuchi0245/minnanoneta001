# テーブル設計

## usersテーブル

| Column                | Type      | Options                        |
| --------------------- | --------- | ------------------------------ |
| nickname              | string    | null: false, unique: true      |
| email                 | string    | null: false, unique: true      |
| encrypted_password    | string    | null: false                    |
| birth_date            | date      | null: false                    |

## アソシエーション

| method                | model          |
| --------------------- | -------------- |
| has_many              | notes          |
| has_many              | comments       |
| has_many              | likes          |




## notesテーブル

| Column                | Type        | Options                        |
| --------------------- | ----------- | ------------------------------ |
| title                 | string      | null: false                    |
| text                  | text        | null: false                    |
| category_id           | integer     | null: false                    |
| theme_id              | integer     | null: false                    |
| who_id                | integer     | null: false                    |
| user                  | references  | null: false,foreign_key: true  |
| comment               | references  | null: false,foreign_key: true  |


## アソシエーション

| method                | model          |
| --------------------- | -------------- |
| belongs_to            | user           |
| has_many              | comments       |
| has_many              | likes          |





## commentsテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| text                  | text       | null: false                    |
| user                  | references | null: false,foreign_key: true  |
| note                  | references | null: false,foreign_key: true  |

## アソシエーション

| method                | model          |
| --------------------- | -------------- |
| belongs_to            | user           |
| belongs_to            | note           |



## likesテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| user                  | references | null: false,foreign_key: true  |
| note                  | references | null: false,foreign_key: true  |

## アソシエーション

| method                | model          |
| --------------------- | -------------- |
| belongs_to            | user           |
| belongs_to            | note           |