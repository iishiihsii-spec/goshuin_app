class GoshuinsController < ApplicationController
  def index
    @goshuins = Goshuin.where(user_id: current_user.id)
  end
end
