class Room < ApplicationRecord
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
  belongs_to_active_hash :category
  has_many :room_users
  has_many :users, through: :room_users
  has_many :messages
  has_many :room_tags
  has_many :tags, through: :room_tags
  has_many :proposes

  def self.category(category_id)
  Room.where(category_id: category_id)
end
  def self.search(search)
    if search != nil
      Room.where('room_name LIKE(?) or concept LIKE(?)' , "%#{search}%",  "%#{search}%")
    else
      Room.All
    end
  end
end
