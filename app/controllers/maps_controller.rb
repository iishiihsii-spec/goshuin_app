class MapsController < ApplicationController
  before_action :authenticate_user!
  def index
    @goshuins = current_user.goshuins.where.not(latitude: nil, longitude: nil)
  end
end
