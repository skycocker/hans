class HomeController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_wardened_user_presence!, only: %i(index)

  def index
    @wardened_user = current_user.wardened_user
  end

  private

  def ensure_wardened_user_presence!
    current_user.ensure_wardened_user_presence!
  end
end
