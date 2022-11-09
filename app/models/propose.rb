class Propose < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_many :goods
end
