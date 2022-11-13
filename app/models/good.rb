class Good < ApplicationRecord
  belongs_to :user
  belongs_to :propose
with_options presence: true do
  validates :user_id
  validates :propose_id
end
end
