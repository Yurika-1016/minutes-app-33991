class Minute < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :comments, dependent: :destroy
  has_one :to_do_list, dependent: :destroy
  has_many :pins, dependent: :destroy

  with_options presence: true do
    validates :title
    validates :project_name
    validates :participate_member
    validates :meeting_date, format: { with: %r{\A[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}\z} }
    validates :all_complete_date, format: { with: %r{\A[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}\z} }
    validates :content
  end

  def self.search(search)
    if search != ''
      Minute.where('title LIKE(?)', "%#{search}%")
            .or(Minute.where('project_name LIKE(?)', "%#{search}%"))
            .or(Minute.where('participate_member LIKE(?)', "%#{search}%"))
            .or(Minute.where('meeting_date LIKE(?)', "%#{search}%"))
            .or(Minute.where('all_complete_date LIKE(?)', "%#{search}%"))
            .or(Minute.where('content LIKE(?)', "%#{search}%"))
    else
      Minute.all.order(id: 'DESC')
    end
  end
end
