class Minute < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :comments, dependent: :destroy
  has_one :to_do_list, dependent: :destroy

  with_options presence: true do
    validates :title
    validates :project_name
    validates :participate_member
    validates :meeting_date, format: { with: %r{\A[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}\z} }
    validates :all_complete_date, format: { with: %r{\A[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}\z} }
    validates :content
  end
end
