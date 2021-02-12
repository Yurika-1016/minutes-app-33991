# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# アプリケーション名
minutes_app
(議事録管理アプリ)

# アプリケーション概要
会議議事録について業務の見える化ができるツールです。
会議議事録を残し、残課題についての業務管理ができます。
登録してある会議議事録についてログインすれば誰でもコメントもすることができます。

# URL
デプロイ次第記述

# テスト用アカウント
デプロイ次第記述

# 利用方法
- 利用したいユーザーはユーザー登録をしてください。
- ユーザー登録をし、ログインすれば全ての機能を利用できます（他人が投稿したデータの編集・削除等はできない）。
- 一覧ページ：本アプリに登録している人が投稿した議事録一覧を見ることができます。
- 新規議事録登録ボタン：入力フォームに必要事項を入力すると、新規議事録を登録することができます（画像も添付できます）。
- 議事録詳細ページ：投稿された議事録について詳細内容を確認できます。コメント欄には誰でもコメントできます。
  投稿したユーザーに限り、投稿した議事録の編集・削除・完了済み設定(closed)をすることができます。

# 目指した問題解決
会議の議事録管理の問題点としてあげられることは下記点が考えられる。
- 上司承認等が多く、気軽に記録を残せない
- 議事録がメール等で展開される場合、関係者以外会議の内容を把握できない
- 議事録がメール等で展開される場合、多くの会議議事録から該当のメールを探すのが面倒
- 宿題事項があった場合、その進捗を管理できない。
<br>上記の問題点を一括解決できることを目指した。

# 洗い出した要件 (実装完了していないため今後変更の可能性あり)
- ユーザー管理機能
- 新規投稿機能
- 一覧表示機能
- 投稿詳細表示機能
- コメント機能
- 検索機能
- 終了済み(closed)表示機能

# 実装した機能についてのGIFと説明(実装完了していないため別途記載)

# 実装予定の機能
洗い出した要件に記載の項目

# データベース設計(実装完了していないため別途記載)

# ローカルでの動作方法(実装完了していないため別途記載)


## Usersテーブル
|      column      |      type       |                 option                    |
| ---------------- | --------------- | ----------------------------------------- |
|    last_name     |     string      |               null:false                  |
|    first_name    |     string      |               null:false                  |
|      email       |     string      |               null:false                  |
|encrypted_password|     string      |               null:false                  |
|  employee_number |     integer     |null:false, format: {with: /\A[0-9]{5}\z/ }|
### Association
- has_many :minutes
- has_many :comments
- has_many :to_do_lists

## Minutesテーブル
|           column           |      type       |                            option                                |
| -------------------------- | --------------- | ---------------------------------------------------------------- |
|           title            |     string      |                           null:false                             |
|         project_name       |     string      |                           null:false                             |
|     participate_member     |      text       |                           null:false                             |
|        meeting_date        |     string      |null:false, format: { with: /\A[0-9]{4}\/[0-9]{1,2}\/[0-9]{1,2}\z/|
|     all_complete_date      |     string      |null:false, format: { with: /\A[0-9]{4}\/[0-9]{1,2}\/[0-9]{1,2}\z/|
|        content             |      text       |                                                                  |
|          user_id           |    references   |                  null:false, foreign_keys: true                  |
### Association
- belongs_to :user
- has_many :comments
- has_one :to_do_list

## Commentsテーブル
|           column           |      type       |                 option                    |
| -------------------------- | --------------- | ----------------------------------------- |
|           title            |      text       |               null:false                  |
|          user_id           |    references   |       null:false, foreign_keys: true      |
|         minute_id          |    references   |       null:false, foreign_keys: true      |
### Association
- belongs_to :user
- belongs_to :minute

## ToDoListsテーブル
|           column           |      type       |                 option                    |
| -------------------------- | --------------- | ----------------------------------------- |
|           list1            |      text       |              null:false                   |
|           list2            |      text       |                                           |
|           list3            |      text       |                                           |
|           list4            |      text       |                                           |
|           list5            |      text       |                                           |
|           list6            |      text       |                                           |
|           list7            |      text       |                                           |
|           list8            |      text       |                                           |
|           list9            |      text       |                                           |
|           list10           |      text       |                                           |
|          user_id           |    references   |       null:false, foreign_keys: true      |
|         minute_id          |    references   |       null:false, foreign_keys: true      |
### Association
- belongs_to :user
- belongs_to :minute

## Pinsテーブル
|           column           |      type       |                 option                    |
| -------------------------- | --------------- | ----------------------------------------- |
|          user_id           |    references   |       null:false, foreign_keys: true      |
|         minute_id          |    references   |       null:false, foreign_keys: true      |
### Association
- belongs_to :user
- belongs_to :minute