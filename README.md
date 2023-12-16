# アプリケーション名
アボカドサークル

# 概要
アボカドを育てる人が、適切な管理で栽培をするために
情報を共有したり、成長やタスクの管理ができるアプリです。

## アプリケーションを作成した背景
きっかけは、妻がアボカドを観葉植物として家で育てており、その時の季節や成長過程にあった適切な管理の仕方に悩む時があるという話を聞いたことです。  
そこから、FaceBookの”アボカドを作ろう会”というコミュニティの参加者にもヒアリングを行った結果、アボカドを栽培する人たちが「それぞれの状況に適した管理方法を一人で判断するのが難しい」という共通の課題を抱えていることがわかりました。  
また、義母がアボカドの栽培をする序盤の段階で挫折してしまったという話を聞きました。アボカドの栽培は手軽に始められる分、挫折するのも多くいるのではないかという仮説を立てました。  
以上を踏まえ、アボカドを育てている人、これから育てる人たちが、適切な管理や情報交換ができ、挫折せずにより栽培を長く楽しんでもらえるアプリケーションを開発したいと考えました。  

# 実装機能
[![Image from Gyazo](https://i.gyazo.com/fc4fde4e46289295f5b83dd5ec3d92cb.png)](https://gyazo.com/fc4fde4e46289295f5b83dd5ec3d92cb)

# 実装予定の機能
[![Image from Gyazo](https://i.gyazo.com/ebc2789995fcd00070a1180be703e5ac.png)](https://gyazo.com/ebc2789995fcd00070a1180be703e5ac)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/afcf398ddec7b417bfc05e403448694c.png)](https://gyazo.com/afcf398ddec7b417bfc05e403448694c)

# ER図
[![Image from Gyazo](https://i.gyazo.com/2b2c9e1c140349bf49fee564db0c9637.png)](https://gyazo.com/2b2c9e1c140349bf49fee564db0c9637)

# 開発環境
・フロントエンド：JavaScript  
・バックエンド：Ruby(3.2.0), Rails(7.0.8)  
・インフラ：render

# 利用方法
ぜひゲストログインの上ご利用ください。

## 栽培記録の閲覧
・ハートマークをクリックで”いいね”ができます。  
・投稿画面をクリックすると、コメントの投稿および閲覧がきます。  
・ユーザー名をクリックすると、ユーザーページの閲覧ができます。

## 栽培記録の投稿
・「投稿する」ボタンをクリックください。  
・記録日、状態、テキスト、画像を入力し投稿します。  
・画像とテキストは、どちらか一方のみの入力でも投稿が可能です。

## 質問の閲覧
・「質問をみる」のコマンドより閲覧がきます。  
・投稿画面をクリックすると、回答の投稿および閲覧がきます。

## 質問の投稿
・「質問する」のコマンドより投稿ができます。  
・タイトル、テキスト、画像を入力し投稿します。  
・画像とテキストは、どちらか一方のみの入力でも投稿が可能です。

## ユーザーページの編集
※ユーザー情報は、ゲストログインの場合は編集ができません。  
・トップページの左上をクリックください。  
・「プロフィール編集」をクリックすると、編集ページに遷移します。  
・ユーザー情報は、ユーザー名、目的、都道府県、自己紹介文が編集できます。  
・ユーザーのロゴマークは。目的によって自動で切り替わリます。  
・「アボカドの登録(編集)」をクリックすると、編集ページに遷移します。  
・アボカド情報は、アボカドの名前、栽培開始日、３つのタスクの実施日を登録できます。  
・下部は、ユーザーが投稿した記録、質問、いいねした投稿、回答した投稿が閲覧できます。  

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
- has_many :likes


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
| solution              | integer    | null: false   
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
