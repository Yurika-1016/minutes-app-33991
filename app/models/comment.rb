class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :minute
  # has_many_attached :images

  validates :title, presence: true
end
