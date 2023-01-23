# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false, unique:true |
| profile            | text   | null: false |
| occupation         | text   | null: false |
| position           | text   | null: false |



## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| content| text       | null: false |
| user   | references | null: false, foreign_key: true |
| prototype | references | null: false, foreign_key: true |


## prototypes テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| title   | string     | null: false                   |
| user    | references | null: false, foreign_key: true |
| catch_copy   | text | null: false, foreign_key: true |
| concept   | text | null: false |
