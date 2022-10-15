# README
#テーブル設計
## users テーブル
| Column             | Type     | Option                     |
| -------            | ------   |  ------                    |
| nickname           | string   | null: false                |
| email              | string   | null: false,  unique: true |
| encrypted_password | string   | null: false                |
| area_id            | string   | null: false                |


### association
- has_many :room_users
- has_many :comments
- has_many :rooms

## room_usersテーブル
| Colmn    | Type       | Option               |
| ------   | -----      | ------               |
| room     | references | foreign_key: true    |
| user     | references | foreign_key: true    |

##  association

- belongs :room
- belongs :user

## roomsテーブル
| Column         | Type     | Option            |
| ------         | ----     | ----------        |
| room_name      | string   | null: false       | 
| concept        | string   | null: false       |
| category_id    | integer  | null: false       |
| area_id        | integer  | null: false       |
| tag            | string   | unique: true      |

## association
- has_many :room_users
- has_many :users
- has_many :messages
- has_many :tags
- jas_many :room_tags

## room_tagsテーブル
| Column  | Type       | Option            |
| ------  | --------   |------             |
| room    | references | foreign_key: true |
| tag     | references | foreign_key: true |
### association

- belongs_to :room 
- belongs_to :tag

## tagsテーブル
| Column    | Type      | Option      |
| ------    | -----     | ----------  |
| tag_name  | string    | ------      | 

## association

- has_many :rooms
- has_many :room_tags


## messagesテーブル
| Column  | Type   | Option      |
| ------  | ------ | ----------- |
| content | string | null: false |  

## associetion

- belongs_to :user
- belongs_to :room


