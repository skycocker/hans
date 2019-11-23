class UserWarden < ApplicationRecord
  belongs_to :user
  belongs_to :warden, class_name: 'User'

  validates :user,   presence: true
  validates :warden, presence: true, uniqueness: { scope: :user }
end
