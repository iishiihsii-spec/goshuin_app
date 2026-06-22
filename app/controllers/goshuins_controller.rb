class GoshuinsController < ApplicationController
  before_action :authenticate_user!
  GOSHUIN_LEVELS = [
    { level: 7, min_count: 100, name: "御朱印マスター", next_count: nil }, 
    { level: 6, min_count: 75, name: "御朱印名人", next_count: 100 }, 
    { level: 5, min_count: 50, name: "御朱印達人", next_count: 75 }, 
    { level: 4, min_count: 30, name: "御朱印上級者", next_count: 50 }, 
    { level: 3, min_count: 10, name: "御朱印旅人", next_count: 30 }, 
    { level: 2, min_count: 5, name: "御朱印見習い", next_count: 10 }, 
    { level: 1, min_count: 0, name: "御朱印初心者", next_count: 5 }
  ].freeze

  def index
    @goshuins = current_user.goshuins.with_attached_image
    @goshuin_count = @goshuins.count
    @current_level = current_level(@goshuin_count)
    @level = @current_level[:level]
    @level_name = @current_level[:name]
    @next_level_count = next_level_count(@goshuin_count, @current_level)
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

  def current_level(count) 
    GOSHUIN_LEVELS.find { |level| count >= level[:min_count] }
  end
  
  def next_level_count(count, current_level)
    return "最大レベルです" if current_level[:next_count].nil?
    current_level[:next_count] - count 
  end

  def goshuin_params
    params.require(:goshuin).permit(:place_name, :visited_date, :category_id, :memo, :latitude, :longitude, :image).merge(user_id: current_user.id)
  end
end
