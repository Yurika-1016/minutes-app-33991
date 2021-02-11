class ToDoList < ApplicationRecord
  belongs_to :user
  belongs_to :minute

  validates :list1, presence: true
end
