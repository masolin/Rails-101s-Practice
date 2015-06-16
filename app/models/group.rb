class Group < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  validates :title, presence: true
  validates :description, length: { minimum: 5, maximum: 200 }
end
