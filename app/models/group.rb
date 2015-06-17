class Group < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :group_users
  has_many :users, through: :group_users

  validates :title, presence: true
  validates :description, length: { minimum: 5, maximum: 200 }
end
