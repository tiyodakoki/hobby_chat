class Propose < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_many :goods

with_options presence: true do
  validates :title
  validates :concept
  validates :require_people
  validates :room_id
  validates :user_id
end
end
