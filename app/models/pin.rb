class Pin < ApplicationRecord
  belongs_to :user
  belongs_to :minute

  validates :user_id, uniqueness: { scope: :minute_id }
end
