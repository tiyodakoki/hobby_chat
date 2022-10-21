class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
  has_many :room_users
  has_many :room, through: :room_users
         
end
