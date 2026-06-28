class UserStampsController < ApplicationController
  before_action :authenticate_user!
  def index
    @user_stamps = current_user.user_stamps.includes(:stamp)
  end
end
