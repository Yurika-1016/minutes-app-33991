class Close < ApplicationRecord
  belongs_to :minute

  validates :minute_id, uniqueness: true
end
