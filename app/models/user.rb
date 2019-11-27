class User < ApplicationRecord
  include HasWardenedUser

  devise :database_authenticatable, :recoverable,
         :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name,  presence: true

  def friendly_identifier
    "#{first_name} #{last_name} (#{email})"
  end
end
