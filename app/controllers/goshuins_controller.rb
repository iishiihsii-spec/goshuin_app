class GoshuinsController < ApplicationController
  before_action :authenticate_user!
  def index
    @goshuins = Goshuin.where(user_id: current_user.id)
  end

  def new
    @goshuin = Goshuin.new
  end
  
  def create
    @goshuin = Goshuin.new(goshuin_params)
    if @goshuin.save
      redirect_to goshuins_path, notice: "御朱印を登録しました"
    else
      flash.now[:alert] = "御朱印の登録に失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def goshuin_params
    params.require(:goshuin).permit(:place_name, :visited_date, :category_id, :memo).merge(user_id: current_user.id)
  end
end
