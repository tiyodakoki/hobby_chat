class Tag < ApplicationRecord
  has_many :room_tags
  has_many :rooms, through: :room_tags
  validates :tag_name,  uniqueness: true
  def self.search(search)
    if search != '#'
      tag = Tag.where(tag_name: search)
      binding.pry
      tag.rooms
    
    else
      Room.all
    end
end
end
