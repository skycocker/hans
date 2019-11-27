module HasWardenedUser
  extend ActiveSupport::Concern

  def wardened_user
    ensure_wardened_user_presence!
  end

  def ensure_wardened_user_presence!
    user_warden = UserWarden.where(warden: self).first_or_initialize
    return user_warden if user_warden.persisted?

    wardened_user_ids  = UserWarden.pluck(:user_id)
    non_wardened_users = User.where.not(id: wardened_user_ids + [id])

    user_warden.user = non_wardened_users.sample
    user_warden.save!

    user_warden
  end
end
