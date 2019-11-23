module HasUserWarden
  extend ActiveSupport::Concern

  def wardened_user
    ensure_wardened_user_presence!
  end

  def ensure_wardened_user_presence!
    UserWarden.where(warden: self).first_or_create! do |user_warden|
      non_wardened_user_ids = UserWarden.pluck(:user_id)
      non_wardened_users    = User.where.not(id: non_wardened_user_ids + [id])

      random_offset    = rand(non_wardened_users.count)
      user_warden.user = non_wardened_users.offset(random_offset).first!
    end
  end
end
