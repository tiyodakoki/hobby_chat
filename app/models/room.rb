class Room < ApplicationRecord
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
  belongs_to_active_hash :category
  has_many :room_users
  has_many :users, through: :room_users
  has_many :messages
end
