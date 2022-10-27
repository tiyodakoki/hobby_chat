class RoomForm
  include ActiveModel::Model
  attr_accessor :room_name, :concept, :category_id, :area_id, :tag_name, :user_id
  with_options presence: true do
    validates :room_name
    validates :concept
    validates :category_id
    validates :area_id
    validates :tag_name
  end
  def save
    @room = Room.create(room_name: room_name, concept: concept, category_id: category_id, area_id: area_id, user_id: user_id)
    @tag = Tag.where(tag_name: tag_name).first_or_initialize
    @tag.save
    RoomTag.create(room_id: @room.id, tag_id: @tag.id)
  end
end