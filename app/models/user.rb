class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :last_name
    validates :first_name
    validates :employee_number, format: { with: /\A[0-9]{5}\z/ }
  end

  has_many :minutes
  has_many :comments
  has_many :to_do_lists
end
