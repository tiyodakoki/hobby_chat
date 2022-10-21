class RoomTag
  include ActiveModel::model
  attr_accessor :room_name, :concept, :category_id, :area_id, :tag_name
  with_options presence: true do
    validates :room_name
    validates :concept
    validates :category_id
    validates :area_id
    validates :tag_name
  end
  def save
    Room.create(room_name: room_name, concept: concept, category_id: category_id, area_id: area_id, tag_name: tag_name)
end