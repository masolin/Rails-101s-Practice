class Post < ActiveRecord::Base
  belongs_to :group, counter_cache: true
  belongs_to :user
  validates :content, presence: true
end
