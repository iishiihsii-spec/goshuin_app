class GoshuinsController < ApplicationController
  before_action :authenticate_user!
  def index
    @goshuins = current_user.goshuins.with_attached_image
  end

  def new
    @goshuin = Goshuin.new
  end

  def show
    @goshuin = current_user.goshuins.find(params[:id])
  end

  def create
    @goshuin = Goshuin.new(goshuin_params)
    if @goshuin.save
      redirect_to goshuins_path, notice: "御朱印を登録しました"
    else
      flash.now[:alert] = "御朱印の登録に失敗しました"
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
    @goshuin = current_user.goshuins.find(params[:id])
  end

  def update
    @goshuin = current_user.goshuins.find(params[:id])
    if @goshuin.update(goshuin_params)
      redirect_to goshuins_path, notice: "御朱印を更新しました"
    else
      flash.now[:alert] = "御朱印の更新に失敗しました"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @goshuin = current_user.goshuins.find(params[:id])
    if @goshuin.destroy
      redirect_to goshuins_path, notice: "御朱印を削除しました"
    else
      flash.now[:alert] = "御朱印の削除に失敗しました"
      render :edit, status: :unprocessable_entity
    end
  end
  private

  def goshuin_params
    params.require(:goshuin).permit(:place_name, :visited_date, :category_id, :memo, :latitude, :longitude, :image).merge(user_id: current_user.id)
  end
end
