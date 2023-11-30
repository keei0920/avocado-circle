# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------  | ------------------------- |
| nickname           | string  | null: false               |
| introduce          | text    |                           |
| prefecture_id      | integer | null: false               |
| purpose_id         | integer | null: false               |
| email              | string  | null: false, unique: true |
| password           | string  | null: false               |


### Association

- has_many :avocados
- has_many :posts
- has_many :comments
- has_many :questions
- has_many :answers
- has_many :answer_comments


## avocados テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | -----------------------------  |
| name                  | string     | null: false                    |
| birth_day             | date       |                                |
| watering              | date       |                                |
| transplant            | date       |                                |
| fertilizer            | date       |                                |
| user                  | references | null: false, foreign_key: true |

### Association

- belongs_to :user


## posts テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | -----------------------------  |
| text                  | text       | null: false                    |
| condition_id          | integer    | null: false                    |
| date                  | date       | null: false                    |
| user                  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many  :comments


## comments テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | -----------------------------  |
| text                  | text       | null: false                    |
| post                  | references | null: false, foreign_key: true |
| user                  | references | null: false, foreign_key: true |

### Association

- belongs_to :post
- belongs_to :user

## questions テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | -----------------------------  |
| title                 | string     | null: false                    |
| text                  | text       | null: false                    |
| user                  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :answers

## answers テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | -----------------------------  |
| text                  | string     | null: false                    |
| question              | references | null: false, foreign_key: true |
| user                  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :question
- have_many :answer_questions

## answer_comments テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | -----------------------------  |
| text                  | string     | null: false                    |
| answer                | references | null: false, foreign_key: true |
| user                  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :answer

## likes テーブル
| Column                | Type       | Options                        |
| --------------------- | ---------- | -----------------------------  |
| post                  | string     | null: false, foreign_key: true |
| user                  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :answer
